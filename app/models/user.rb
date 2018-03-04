class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  include UskillityBaseModel

  #after_initialize :init

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

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
  default_scope { includes(:images) }

  has_many :pictures, foreign_key: :user_id, class_name: 'Image'

  def init
    # Set default image -- currently not in use
    self.image ||= "http://placehold.it/50x50"
  end

  def token_validation_response
    UserSerializer.new(self, root: false)
  end

  def fallback_image
    self.image || (ENV['AWS_ASSET_HOST_BASEURL'] +'/fallbacks/profile.png')
  end

  def full_name
    [first_name, name].reject(&:blank?).join(' ')
  end

  def generate_devise_auth_tokens
    # create client id and token
    client_id = SecureRandom.urlsafe_base64(nil, false)
    token     = SecureRandom.urlsafe_base64(nil, false)

    # store client + token in user's token hash
    tokens[client_id] = {
      token: BCrypt::Password.create(token),
      expiry: (Time.now + 6.months).to_i
    }
    return [client_id, token]
  end

end
