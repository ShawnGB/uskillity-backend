class Transaction < ApplicationRecord
  belongs_to :participation

  def participant
    self.participation.user
  end

  def provider
    self.participation.workshop_session.workshop.provider
  end

  # Total amount converted to cents
  def total_amount
    (total * 100).to_i
  end

  def item_bought
    Participation.find_by_id(self.participation_id)
  end

end
