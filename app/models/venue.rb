class Venue < ApplicationRecord
  validates :country_alpha2, inclusion: { in: ISO3166::Country.all.map { |c| c.alpha2 } }

  geocoded_by :full_street_address
  after_validation :geocode,  if: ->(obj){ !obj.full_street_address.empty? and obj.address_changed? }

  def address_changed?
    self.changed? && !(self.changes.keys & ['street', 'house_number', 'zip', 'city', 'country', 'state']).empty?
  end

  def full_street_address
    [street + house_number, zip, city, country].compact.join(', ')
  end
end
