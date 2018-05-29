class Participation < ApplicationRecord
  belongs_to :workshop_session
  has_one :workshop, through: :workshop_session
  belongs_to :user
  belongs_to :order

  validates :workshop_session, presence: true
  validates :user, presence: true
end
