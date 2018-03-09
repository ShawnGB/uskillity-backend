class WorkshopSession < ApplicationRecord
  belongs_to :workshop
  has_many :participations
  has_many :participants, through: :participations, source: :user

  translates :title, :subtitle, :description

  validates :starts_at, presence: true
  validates :ends_at, {
    presence: true,
    date: {
      after: :starts_at,
      message: "A session cannot end before it starts"
    }
  }
  validates :ends_at, {
    presence: true,
    date: {
      before_or_equal_to: Proc.new { |obj| obj.starts_at.end_of_day },
      message: "A session should start and end on the same day"
    }
  }
end
