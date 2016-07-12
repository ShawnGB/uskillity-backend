json.array!(@levels) do |level|
  json.extract! level, :id, :name_translations, :value, :is_active
  json.url level_url(level, format: :json)
end
