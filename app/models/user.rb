class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  include UskillityBaseModel
  after_initialize :init
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :comments, as: :commenter
  has_many :workshops_offered, foreign_key: :provider_id, class_name: 'Workshop'
  has_many :workshop_sessions, foreign_key: :tutor_id
  has_many :workshops_tutored, through: :workshop_sessions, source: :workshop
  has_many :workshop_registrations
  has_many :workshops_registered, through: :workshop_registrations, source: :workshop
  has_many :participations, through: :workshop_registrations
  has_many :ratings, as: :rated
  has_many :created_ratings, foreign_key: :creator_id, class_name: 'Rating'

  has_many :images, as: :of
  has_many :pictures, foreign_key: :user_id, class_name: 'Image'

	def self.from_omniauth_facebook(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			user.name = auth.info.last_name
      user.first_name = auth.info.first_name
      user.image = auth.info.image
      user.locale = auth.extra.raw_info.locale
      user.gender = auth.extra.raw_info.gender
		end
	end

  def init
    self.image ||= "http://placehold.it/50x50"
  end

end
