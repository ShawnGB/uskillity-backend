class WorkshopSession < ApplicationRecord
  belongs_to :level
  belongs_to :tutor, class_name: 'User'
  belongs_to :workshop
  belongs_to :venue

  translates :title, :subtitle, :description

  validates :title_en, length: { within: 8..140 }
  validates :title_de, length: { within: 8..140 }
  validates :subtitle_en, length: { within: 8..140 }
  validates :subtitle_de, length: { within: 8..140 }
  validates :description_en, length: { within: 140..1024 }
  validates :description_de, length: { within: 140..1024 }

  validates :level, presence: true
  validates :tutor, presence: true
end
