module UskillityBaseModel
  extend ActiveSupport::Concern

  require 'uri'

  def image
    AssetUrls.static_path_for(self[:image], '/images')
  end

  def main_image
    AssetUrls.static_path_for(self[:main_image], '/images')
  end

  def more_images
    self[:more_images].map{ |img| AssetUrls.static_path_for(img, '/images') }
  end
end
