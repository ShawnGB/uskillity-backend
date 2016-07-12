json.array!(@workshop_registrations) do |workshop_registration|
  json.extract! workshop_registration, :id, :workshop_id, :user_id, :booking_id, :status
  json.url workshop_registration_url(workshop_registration, format: :json)
end
