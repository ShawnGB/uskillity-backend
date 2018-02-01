class WorkshopSession < ApplicationRecord
  belongs_to :level
  belongs_to :tutor, class_name: 'User'
  belongs_to :workshop
  belongs_to :venue

  has_many :participations
  has_many :workshop_registrations, through: :participations
  has_many :participants, through: :workshop_registrations, source: :user

  translates :title, :subtitle, :description

  #validates :title_en, length: { within: 8..140 }
  #validates :title_de, length: { within: 8..140 }
  #validates :subtitle_en, length: { within: 8..140 }
  #validates :subtitle_de, length: { within: 8..140 }
  #validates :description_en, length: { within: 140..1024 }
  #validates :description_de, length: { within: 140..1024 }

  #validates :level, presence: true
  #validates :tutor, presence: true
end
