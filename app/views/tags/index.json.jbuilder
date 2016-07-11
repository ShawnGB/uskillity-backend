json.array!(@tags) do |tag|
  json.extract! tag, :id, :text, :lang
  json.url tag_url(tag, format: :json)
end
