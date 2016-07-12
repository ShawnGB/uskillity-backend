json.array!(@ratings) do |rating|
  json.extract! rating, :id, :value, :creator_id, :rated_object_id, :rated_object_type
  json.url rating_url(rating, format: :json)
end
