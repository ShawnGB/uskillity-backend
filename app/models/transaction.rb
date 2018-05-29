class Transaction < ApplicationRecord
  belongs_to :order

  def participant
    self.order.participations.first.user
  end

  def provider
    workshop.provider
  end

  def workshop
    workshop_session.workshop
  end

  def workshop_session
    self.order.participations.first.workshop_session
  end

  def workshop_price
    workshop.fees.blank? ? 0 : workshop.fees
  end

  # Total amount converted to cents
  def total_amount
    self.order.participations.count * (workshop_price * 100).to_i
  end

  def description
    "#{participant.email} just bought #{workshop.title} for $#{total_amount/100}, from #{provider.email} for transaction ID: #{id}"
  end

  def item_bought
    Participation.find_by_id(self.order.participations.first.id)
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
    if self.paid
      raise StandardError.new("Payment has already been made, transaction id: #{self.id}")
    end

    if provider.stripe_uid.blank?
      raise StandardError.new("Workshop Provider #{provider.id_to_s} has not connected their stripe account. Cannot make payment, transaction id: #{self.id}")
    end

    if self.order.payment_method == "creditcard" && participant.stripe_customer_id.blank?
      raise StandardError.new("Order Id: #{self.order.id} - Participant Id: #{participant.id.to_s} - No creditcard connected. Please register a creditcard to use creditcard payments.")
    end

    charge = {
      amount: total_amount, # Total Amount user will be charged (in cents)
      currency: 'EUR', # Currency of charge
      description: description, # Description of charge
      # Final Destination of charge (host standalone account)
      # Expect format of acct_00X0XXXXXxxX0xX
      destination: self.provider.stripe_uid,
      application_fee: fee.to_i # Fee  (as % but converted to cent)
    }
    Rails.logger.info "preparing charge: #{charge.to_s}"

    payer = if self.order.payment_method == "creditcard"
              {  customer: participant.stripe_customer_id }
            elsif self.order.payment_method == "giropay"
              { source: self.order.stripe_source }
            end

    Rails.logger.info "preapring payer: #{payer.to_s}, making charge"

    charge = Stripe::Charge.create(charge.merge(payer))
    # if the charge is successful, we'll receive a response in the charge object
    # We can then query that object via charge.paid
    # if true we can update our attribute
    Rails.logger.info "is charge paid? #{charge.paid?}"
    if charge.paid?
      after_charge_succeeded(charge, fee)
    end

  rescue => e

    Rails.logger.info "Could not create the charge. #{e.message}"
    errors.add(:stripe_charge_error, "Could not create the charge. #{e.message}")
    #notify platform admins via sentry
    Raven.capture_exception(e)
  end

  def after_charge_succeeded(charge, fee)
    Rails.logger.info "charge successful, now send emails..."
    update_attributes(paid: true, stripe_charge: charge.id, fee_charged: (fee.to_i/100), total: charge.amount/100)
    Rails.logger.info "charge updated #{charge.to_s}"
    ws = Workshop.includes(:provider).find(workshop.id)
    Rails.logger.info "found workshop with id #{ws.id}, now sending emails"
    # inform both the provider and the participant about the successful ticket purchase
    UserMailer.participations_created(ws, participant, self.order.participations.count).deliver
    UserMailer.you_are_participating(ws, workshop_session, participant, self.order.participations).deliver
  end
end
