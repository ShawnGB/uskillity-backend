class Level < ApplicationRecord
  has_many :workshop_sessions
  has_many :workshops

  translates :name

  validates :value, inclusion: 0..100
  validates :name_en, length: { within: 2..64 }
  validates :name_de, length: { within: 2..64 }
end
