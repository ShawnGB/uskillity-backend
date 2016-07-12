class Participation < ApplicationRecord
  belongs_to :workshop_session
  belongs_to :workshop_registration
end
