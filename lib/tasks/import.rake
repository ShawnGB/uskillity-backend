namespace :import do
  desc "Imports the workshop objects found in the given CSV file"
  task :workshops, [:url] => :environment do |t, args|
    filename = args.url
    raise "Cannot find the csv file" unless FileTest.exists?(filename)
    csv_file = File.open(filename, "rb")
    csv_contents = csv_file.read
    create_workshops_from_csv csv_contents
  end

  task :workshops_s3, [:url] => :environment do |t, args|
    s3 = Aws::S3::Resource.new(
      region: ENV['AWS_REGION'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    )
    csv_file = s3.bucket(ENV['S3_BUCKET_NAME']).object(args.url).get
    csv_contents = csv_file.body.string
    raise "Cannot read from S3" unless csv_contents != nil
    create_workshops_from_csv csv_file.body.string
  end

  def create_workshops_from_csv(csv_string)
    require 'csv'
    CSV.parse(csv_string, headers: true, col_sep: ',') do |row|
      row_hash = row.to_hash
      given_id = row_hash.delete("id")
      if given_id.nil?
        puts row_hash.to_yaml
        puts "An id needs to be provided for reference"
        next
      end

      workshop_columns = %w(
        title_de
        title_en
        subtitle_de
        subtitle_en
        description_de
        description_en
        category_id
        fees
        provider_id
        main_image
        minimum_workshop_registration_count
        maximum_workshop_registration_count
        price
      )
      next if are_columns_missing(row_hash, given_id, workshop_columns)

      #validations

      category_id = row_hash["category_id"]
      if Category.find_by_id(category_id).nil?
        puts "No such category with id: #{category_id} []"
        next
      end

      provider_id = row_hash["provider_id"]
      if User.find_by_id(provider_id).nil?
        puts "No such User with id: #{provider_id} []"
        next
      end

      puts "Attempting to create workshop named #{row_hash["title_en"]}"
      Workshop.create!(row_hash)
      puts "Created"

    end
  end

  def are_columns_missing(row_hash, id, columns)
    missing = false
    columns.each do |c|
      if !row_hash.key?(c) || row_hash[c].blank?
        missing = true
        puts "Id: #{id}. The value for #{c} must be specified."
      end
    end
    return missing
  end

  def sanitize_asset_host_urls(row_hash, urls)
    urls.each do |url|
      row_hash[url] = sanitize_asset_host_url(row_hash[url]) if row_hash.key?(url)
    end
  end

  # Returns only the path (without leading '/') form the given url string
  # Params:
  # +url+:: string containing the url to be sanitized
  def sanitize_asset_host_url(url)
    if !url.blank?
      uri = URI.parse(url)
      if !uri.host.blank?
        url.replace uri.path[1..-1]
      end
    end
    url
  end

end
