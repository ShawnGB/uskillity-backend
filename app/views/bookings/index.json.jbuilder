json.array!(@bookings) do |booking|
  json.extract! booking, :id, :dummy
  json.url booking_url(booking, format: :json)
end
