class Comment < ApplicationRecord
  belongs_to :commenter, class_name: 'User'
  belongs_to :commented_object, polymorphic: true
end
