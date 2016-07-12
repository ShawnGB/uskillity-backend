json.array!(@comments) do |comment|
  json.extract! comment, :id, :text, :commenter_id, :lang, :commented_object_id, :commented_object_type
  json.url comment_url(comment, format: :json)
end
