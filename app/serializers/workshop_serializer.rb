class WorkshopSerializer < ActiveModel::Serializer
  belongs_to :provider, class_name: 'User'
  attributes :id, :title, :subtitle, :description, :category_id, :fees, :provider_id, :minimum_workshop_registration_count, :maximum_workshop_registration_count, :created_at, :updated_at, :price, :level_id, :full_address, :min_age, :max_age, :rating, :additional_requirements
  attribute :images
  has_many :sessions, class_name: 'WorkshopSession'

  def sessions
    return object.workshop_sessions
  end

  def images
    past_images = (object.more_images || []).append(object.main_image).compact
    return (object.images.map{|image| image.url.url } + past_images).uniq
  end

  def min_age
    object.min_age || 18
  end

  def max_age
    object.max_age || 144
  end

  def rating
    rand(11) / 2.0
  end
end
