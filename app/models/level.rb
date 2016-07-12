class Level < ApplicationRecord
  translates :name

  validates :value, inclusion: 0..100
end
