class WorkshopRepository

  def self.random(count=6)
    imaged_ws_ids = Workshop.includes(:images).where.not(images: { of_id: nil }).pluck(:id)
    workshops.where(id: imaged_ws_ids).sample(count)
  end

  def self.categorised_workshops(category)
    workshops.where(category: category)
  end

  def self.workshop_with_id(id, user=nil)
    if user.nil? || user.id.nil?
      # Not too sure this is the correct way.
      return workshops({}, {}).find_by(id: id)
    end

    workshop = workshops({}, {}).find_by(id: id)
    if workshop && ( workshop.is_viewable ||  (workshop.provider_id == user.id) )
      return workshop
    end

    nil
  end

  def self.workshops_by_user(user, current_user=nil)
    if (current_user && current_user.id == user.id)
      return workshops({}, {}).where(provider: user)
    end
    return workshops.where(provider: user)
  end

  def self.workshops(conditions={is_approved: true, terms_accepted: true}, session_conditions={starts_at: Time.now..10.years.from_now})
    Workshop.includes({provider: :images}, :images, {workshop_sessions: :participations}).where(conditions).joins(:workshop_sessions).where(workshop_sessions: session_conditions)
  end
end
