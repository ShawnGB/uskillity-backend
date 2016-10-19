module AssetUrls
  require 'uri'
  class << self
    def static_path_for(path, prefix='')
      return unless path.present?
      path = "#{static_asset_host}/static#{prefix}/#{path}"
      uri = URI("#{static_asset_host}")
      path = "http://" + path if uri.scheme.blank?
      return path
    end

    def static_asset_host
      ENV["STATIC_ASSET_HOST"] || "https://s3.eu-central-1.amazonaws.com/uskillity-assets"
    end
  end
end
