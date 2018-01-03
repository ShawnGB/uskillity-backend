class Workshop < ApplicationRecord
  include UskillityBaseModel

  enum recurrence_type: { never: 0, daily: 1, weekly: 2, monthly: 3, yearly: 4}

  before_validation :set_images_if_absent

  belongs_to :category
  belongs_to :provider, class_name: 'User'
  belongs_to :level
  belongs_to :venue

  has_many :workshop_sessions
  #has_many :venues, through: :workshop_sessions
  #has_many :tutors, through: :workshop_sessions

  has_many :workshop_registrations
  has_many :registered_users, through: :workshop_registrations, source: :user

  has_many :comments, as: :commented_object

  translates :title, :subtitle, :description

  validates :title_en, length: { within: 4..140 }
  validates :title_de, length: { within: 4..140 }
  validates :subtitle_en, length: { within: 8..140 }
  validates :subtitle_de, length: { within: 8..140 }
  validates :description_en, length: { within: 32..1024 }
  validates :description_de, length: { within: 32..1024 }

  validates :category, presence: true
  validates :provider, presence: true

  def set_images_if_absent # TODO remove
    self.main_image = RandomImage.get if self.main_image.blank?
    self.more_images = RandomImage.get(3) if self.more_images.blank?
  end

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
