class WorkshopSessionSerializer < ActiveModel::Serializer
  attributes :id, :starts_at, :ends_at, :participations
end
