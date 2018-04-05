class Transaction < ApplicationRecord
  belongs_to :participation

  def participant
    self.participation.user
  end

  def provider
    workshop.provider
  end

  def workshop
    self.participation.workshop_session.workshop
  end

  def workshop_price
    workshop.price.blank? ? 0 : workshop.price
  end

  # Total amount converted to cents
  def total_amount
    (workshop_price * 100).to_i
  end

  def description
    "#{participant.email} just bought #{self.participation.workshop_session.workshop.title} for $#{total_amount/100}, from #{provider.email} for transaction ID: #{id}"
  end

  def item_bought
    Participation.find_by_id(self.participation_id)
  end

  def fee
    # include the stripe fees (2.9% + 30cents) and a 10% cut for the platform
    # the buyer pays the full amount
    # recipient will receive full amount - stripe fees - platform cut
    stripe_fees = total_amount * 0.029 + 30
    cut_for_platform = total_amount * 0.10
    return stripe_fees + cut_for_platform
  end

  def make_charge
    # TODO checks...
    # self.provider.stripe_uid cannot be blank
    # self.participant.stripe_customer_id cannot be blank
    # make_charge cannot be made when paid == true
    charge = Stripe::Charge.create({
      # Total Amount user will be charged (in cents)
      amount: total_amount,
      # Currency of charge
      currency: 'EUR',
      # the origin of the charge
      # e.g. customers Stripe Customer ID
      # expect format of "cus_0xxXxXXX0XXxX0"
      customer: participant.stripe_customer_id,
      # Description of charge
      description: description,
      # Final Destination of charge (host standalone account)
      # Expect format of acct_00X0XXXXXxxX0xX
      destination: self.provider.stripe_uid,
      # Fee  (as % but converted to cent)
      application_fee: fee.to_i
      }
    )
  # if the charge is successful, we'll receive a response in the charge object
  # We can then query that object via charge.paid
  # if true we can update our attribute
  if charge.paid?
    after_charge_succeeded(charge, fee)
  end

  rescue => e
    errors.add(:stripe_charge_error, "Could not create the charge. Info from Stripe: #{e.message}")
  end

  def after_charge_succeeded(charge, fee)
    update_attributes(paid: true, stripe_charge: charge.id, fee_charged: (fee.to_i/100), total: charge.amount/100)
  end
end
