class Level < ApplicationRecord
  translates :name

  validates :value, inclusion: 0..100
  validates :name_en, length: { within: 2..64 }
  validates :name_de, length: { within: 2..64 }
end
