class WorkshopSessionSerializer < ActiveModel::Serializer
  attributes :id, :starts_at, :ends_at, :participations

  def participations
    return object.participations.select { |p| !p.is_cancelled }
  end
end
