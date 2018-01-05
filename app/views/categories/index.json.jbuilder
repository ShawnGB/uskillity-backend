json.array!(@categories) do |category|
  json.extract! category, :id, :parent_id, :name, :created_at, :updated_at, :image, :action_word
  json.url category_url(category, format: :json)
end
