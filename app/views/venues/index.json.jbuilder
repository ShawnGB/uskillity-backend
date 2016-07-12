json.array!(@venues) do |venue|
  json.extract! venue, :id, :street, :house_number, :city, :state, :zip, :country_alpha2, :longitude, :latitude, :room_number, :extra_infomation
  json.url venue_url(venue, format: :json)
end
