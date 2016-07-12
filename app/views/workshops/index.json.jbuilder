json.array!(@workshops) do |workshop|
  json.extract! workshop, :id, :title_translations, :subtitle_translations, :description_translations, :category_id, :offered_on, :fees, :provider_id, :main_image, :more_images
  json.url workshop_url(workshop, format: :json)
end
