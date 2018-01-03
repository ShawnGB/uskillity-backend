json.array!(@workshops) do |workshop|
  json.extract! workshop, :id, :title, :subtitle, :description, :category_id, :offered_on, :fees, :provider_id, :main_image, :more_images, :venue_id, :level_id, :full_address, :min_age, :max_age
  json.url workshop_url(workshop, format: :json)
end
