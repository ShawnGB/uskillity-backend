class Rating < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :rated_object, polymorphic: true
end
