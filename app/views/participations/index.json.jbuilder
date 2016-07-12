json.array!(@participations) do |participation|
  json.extract! participation, :id, :workshop_session_id, :workshop_registration_id, :score
  json.url participation_url(participation, format: :json)
end
