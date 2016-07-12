class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :ratings, as: :creator

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

end
