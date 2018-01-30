class UserSerializer < ActiveModel::Serializer
 attributes :id, :name, :first_name, :image, :nickname
 has_many :images
end
