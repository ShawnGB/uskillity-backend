class WorkshopSerializer < ActiveModel::Serializer
  belongs_to :provider, class_name: 'User'
  attributes :id, :title, :subtitle, :description, :category_id, :offered_on, :fees, :provider_id, :recurrence_type, :is_approved, :minimum_workshop_registration_count, :maximum_workshop_registration_count, :created_at, :updated_at, :price, :level_id, :full_address, :min_age, :max_age, :published_at, :rating
  attribute :images

  def images
    past_images = (object.more_images || []).append(object.main_image).compact
    return (object.images.map{|image| image.url.url } + past_images).uniq
  end

  def rating
    rand(11) / 2.0
  end
end
