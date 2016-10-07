class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category'
  has_many :sub_categories, class_name: 'Category', foreign_key: :parent_id
  has_many :workshops

  translates :name, :action_word

  validates :name_en, length: { within: 2..64 }
  validates :name_de, length: { within: 2..64 }

end
