class WorkshopRepository

  def self.random(count=6)
    workshops.take(count)
  end

  def self.categorised_workshops(category)
    workshops.where(category: category)
  end

  def self.workshop_with_id(id)
    workshops.find_by(id: id)
  end

  def self.workshops
    # TODO -- send only ready items.
    Workshop.includes({provider: :images}, :images, :workshop_sessions) # .where(is_approved: true).where.not(published_at: nil)
  end
end