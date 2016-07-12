json.array!(@workshop_sessions) do |workshop_session|
  json.extract! workshop_session, :id, :title_translations, :subtitle_translations, :description_translations, :starts_at, :ends_at, :level_id, :main_image, :more_images, :tutor_id, :workshop_id, :venue_id, :minimum_participation_count, :maximum_participation_count
  json.url workshop_session_url(workshop_session, format: :json)
end
