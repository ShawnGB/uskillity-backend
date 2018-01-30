class WorkshopSerializer < ActiveModel::Serializer
  belongs_to :provider, class_name: 'User'
  attributes :id, :title, :subtitle, :description, :category_id, :offered_on, :fees, :provider_id, :main_image, :more_images, :recurrence_type, :is_approved, :minimum_workshop_registration_count, :maximum_workshop_registration_count, :created_at, :updated_at, :price, :level_id, :full_address, :min_age, :max_age, :published_at
  has_many :images
end
