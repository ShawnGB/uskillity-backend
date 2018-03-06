class WorkshopRepository

  def self.random(count=6)
    imaged_ws_ids = Workshop.includes(:images).where.not(images: { of_id: nil }).pluck(:id)
    workshops.where(id: imaged_ws_ids).sample(count)
  end

  def self.categorised_workshops(category)
    workshops.where(category: category)
  end

  def self.workshop_with_id(id)
    workshops.find_by(id: id)
  end

  def self.workshops_by_user(user)
    workshops.where(provider: user)
  end

  def self.workshops
    # TODO -- send only ready items.
    Workshop.includes({provider: :images}, :images, :workshop_sessions).where(is_approved: true).where(terms_accepted: true)
  end
end
