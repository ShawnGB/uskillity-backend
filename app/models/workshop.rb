class Workshop < ApplicationRecord
  enum recurrence_type: { never: 0, daily: 1, weekly: 2, monthly: 3, yearly: 4}

  belongs_to :category
  belongs_to :provider, class_name: 'User'

  validates :title_en, length: { within: 8..140 }
  validates :title_de, length: { within: 8..140 }
  validates :subtitle_en, length: { within: 8..140 }
  validates :subtitle_de, length: { within: 8..140 }
  validates :description_en, length: { within: 140..1024 }
  validates :description_de, length: { within: 140..1024 }

  validates :category, presence: true
  validates :provider, presence: true

  def is_viewable
    is_approved # && workshop_session.count.nonzero?
  end

  def is_viable
    # registrations.count > minimum_registration_count
    true
  end
end
