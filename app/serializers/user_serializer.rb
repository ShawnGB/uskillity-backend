class UserSerializer < ActiveModel::Serializer
 attributes :id, :name, :first_name, :image, :nickname, :rating
 has_many :images

 def rating
   rand(11) / 2.0
 end
end
