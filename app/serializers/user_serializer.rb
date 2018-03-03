class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :first_name, :nickname, :rating, :image, :about, :edu_bg, :profession, :location
  def image
    return  object.image if object.images.blank?
    return object.images.sort_by{|image| image.id}.last.url.url || (ENV['AWS_ASSET_HOST_BASEURL'] +'/fallbacks/profile.png')
  end

  def rating
    rand(11) / 2.0
  end
end
