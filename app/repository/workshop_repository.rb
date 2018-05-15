class WorkshopRepository
  def self.random(count=6)
    imaged_ws_ids = Workshop.includes(:images).where.not(images: { of_id: nil }).pluck(:id)
    workshops.where(id: imaged_ws_ids).sample(count)
  end

  def self.categorised_workshops(category)
    return [] if category.blank?
    workshops.where(category: category).uniq
  end

  def self.workshop_with_id(id, user=nil)
    if user.nil? || user.id.nil?
      return workshops.find_by(id: id)
    end

    workshop = workshops({}, {}).find_by(id: id)
    if workshop && ( workshop.is_viewable ||  (workshop.provider_id == user.id) )
      return workshop
    end

    nil
  end

  def self.workshops_by_user(user, current_user=nil)
    if (current_user && current_user.id == user.id)
      return workshops({}, {}).where(provider: user).uniq
    end
    return workshops.where(provider: user).uniq
  end

  def self.workshops(conditions={is_approved: true, terms_accepted: true}, session_conditions={starts_at: Time.now..10.years.from_now})
    active_categoriy_ids = Category.active.map(&:id)
    allowed_workshops  = Workshop.where(category_id: active_categoriy_ids).includes({provider: :images}, :images, {workshop_sessions: :participations}).where(conditions)
    if session_conditions.blank?
      allowed_workshops
    else
      allowed_workshops.joins(:workshop_sessions).where(workshop_sessions: session_conditions)
    end
  end

  def self.update_workshop(w, values)
    w.title_en                   = w.title_de                   = values[:title]                   unless values[:title].blank?
    w.subtitle_en                = w.subtitle_de                = values[:subtitle]                unless values[:subtitle].blank?
    w.description_en             = w.description_de             = values[:description]             unless values[:description].blank?
    w.additional_requirements_en = w.additional_requirements_de = values[:additional_requirements] unless values[:additional_requirements].blank?

    w.category_id  = values[:category_id].to_i unless values[:category_id].blank?
    w.fees         = values[:fees].to_i        unless values[:fees].blank?
    w.level_id     = values[:level_id].to_i    unless values[:level_id].blank?
    w.min_age      = values[:min_age].to_i     unless values[:min_age].blank?
    w.max_age      = values[:max_age].to_i     unless values[:max_age].blank?
    w.full_address = values[:full_address]     unless values[:full_address].blank?

    w.maximum_workshop_registration_count = values[:maximum_workshop_registration_count].to_i unless values[:maximum_workshop_registration_count].blank?

    unless values[:terms_accepted].nil?
      w.terms_accepted = values[:terms_accepted]
      if w.terms_accepted and w.published_at.nil?
        w.published_at = Time.zone.now
      end
    end
  end
end
