class Booking < ApplicationRecord
  has_one :workshop_registration
  has_one :user, through: :workshop_registration
end
