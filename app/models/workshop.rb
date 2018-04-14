class Workshop < ApplicationRecord
  include UskillityBaseModel

  enum recurrence_type: { never: 0, daily: 1, weekly: 2, monthly: 3, yearly: 4}

  belongs_to :category
  belongs_to :provider, class_name: 'User'
  belongs_to :level
  belongs_to :venue

  has_many :workshop_sessions, dependent: :delete_all
  has_many :participations, through: :workshop_sessions, dependent: :delete_all
  has_many :participants, through: :participations, source: :user

  has_many :ratings, as: :rated
  has_many :comments, as: :commented_object

  translates :title, :subtitle, :description, :additional_requirements

  validates :title, length: { within: 4..64 }
  validates :description, length: { within: 32..1024 }

  validates :category, presence: true
  validates :provider, presence: true
  validates :level, presence: true
  validates :min_age, numericality: { greater_than_or_equal_to: 13 }, :allow_blank => true
  validates :min_age, numericality: { less_than: 120 }, :allow_blank => true
  validates :max_age, numericality: { greater_than: 13 }, :allow_blank => true
  validates :max_age, numericality: { less_than_or_equal_to: 120 }, :allow_blank => true
  validates :max_age, numericality: { less_than_or_equal_to: 120 }, :allow_blank => true
  validates :maximum_workshop_registration_count, numericality: { greater_than: 0, message: "Participation count must be larger than 0"}
  validates :fees, presence: true
  validates :fees, numericality: { less_than_or_equal_to: 250, message: "Contact the admins for a larger fees/ticket"}, :allow_blank => true
  validate :min_max_are_in_order
  validate :provider_has_a_stripe_account

  after_save :email_user_about_awaiting_approval

  def min_max_are_in_order
    return unless self[:min_age] && self[:max_age]
    age_order_correct = self[:min_age] <= self[:max_age]
    errors[:age_order] << ": min must be lower than max" unless age_order_correct
    return age_order_correct
  end

  def provider_has_a_stripe_account
    return if self.provider.can_receive_payments?
    errors[:stripe] << "You need to have a Stripe business account connected to create workshops"
  end

  has_many :images, as: :of

  def is_viewable
    is_approved && terms_accepted
  end

  def is_viable
    # workshop_registrations.count > minimum_workshop_registration_count
    true
  end

  def action_word
    self[:action_word] || self.category.action_word || self.title
  end

  def email_user_about_awaiting_approval
    if self.changed?  &&                                    # must be changed
        !self.published_at.nil? &&                          # published at is not nil
        self.changed_attributes.key?("published_at")  &&    # but is one of the changed fields
        self.changed_attributes["published_at"].nil?        # must have been nil earlier
      UserMailer.workshop_awaiting_approval(self).deliver
    end
  end
end
