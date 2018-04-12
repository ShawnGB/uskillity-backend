class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :first_name, :nickname, :rating, :image, :about, :edu_bg, :profession, :location, :stripe_provider
  def image
    return object.fallback_image if object.images.blank?
    return object.images.sort_by{|image| image.id}.last.url.url
  end

  def stripe_provider
    return object.can_receive_payments?
  end

  def rating
    rand(11) / 2.0
  end
end
