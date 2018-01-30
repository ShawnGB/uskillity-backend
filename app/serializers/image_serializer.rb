class ImageSerializer < ActiveModel::Serializer
  attributes :id, :url
  #has_one :of
  #has_one :user
end
