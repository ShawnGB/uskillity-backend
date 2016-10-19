module AssetUrls
  require 'uri'
  class << self
    def static_path_for(path, prefix='')
      return unless path.present?
      path = "#{asset_host}/static#{prefix}/#{path}"
      uri = URI("#{asset_host}")
      path = "http://" + path if uri.scheme.blank?
      return path
    end

    def asset_host
      Rails.configuration.action_controller.asset_host
    end
  end
end
