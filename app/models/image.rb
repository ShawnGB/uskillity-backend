class Image < ApplicationRecord
  belongs_to :of, polymorphic: true
  belongs_to :user, class_name: 'User'
end
