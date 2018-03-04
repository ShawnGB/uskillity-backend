class Workshop < ApplicationRecord
  include UskillityBaseModel

  enum recurrence_type: { never: 0, daily: 1, weekly: 2, monthly: 3, yearly: 4}

  belongs_to :category
  belongs_to :provider, class_name: 'User'
  belongs_to :level
  belongs_to :venue

  has_many :workshop_sessions
  #has_many :venues, through: :workshop_sessions
  #has_many :tutors, through: :workshop_sessions

  has_many :workshop_registrations
  has_many :registered_users, through: :workshop_registrations, source: :user

  has_many :ratings, as: :rated
  has_many :comments, as: :commented_object

  translates :title, :subtitle, :description, :additional_requirements

  validates :title, length: { within: 4..64 }
  validates :description, length: { within: 32..1024 }

  validates :category, presence: true
  validates :provider, presence: true
  validates :level, presence: true

  has_many :images, as: :of

  def is_viewable
    is_approved # && workshop_session.count.nonzero?
  end

  def is_viable
    # workshop_registrations.count > minimum_workshop_registration_count
    true
  end

  def action_word
    self[:action_word] || self.category.action_word || self.title
  end
end
