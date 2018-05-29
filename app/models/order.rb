class Order < ApplicationRecord
  has_many :participations
  has_one :payment_transaction, class_name: "Transaction"
  validates :payment_method, presence: true, inclusion: { in: %w(giropay creditcard), message: "%{value} is not a valid payment method" }

  def buyer
    self.participations.first.user
  end

  def workshop_name
    self.participations.first.workshop.title
  end

  def trigger_payment_transaction
    return unless (self.payment_transaction.nil? || !self.payment_transaction.paid?)
    # depending on payment_method of participation, either:
    # create a transaction and directly charge it (if creditcard)
    # or create a transaction for giropay
    #create transaction and trigger the charge
    transaction = Transaction.new(order: self)
    transaction.save!
    if self.payment_method == "creditcard"
      transaction.make_charge
    elsif self.payment_method == "giropay"
      begin
        # create stripe source, send email to user
        stripe_source = Stripe::Source.create(
          :type => "giropay",
          :currency => 'eur',
          :amount => transaction.total_amount,
          :owner => {
            :name => self.buyer.full_name
          },
          :redirect => {
            :return_url => ENV["SERVERHOSTDOMAIN"] + "/stripe_giropay_callback?order_id=" + self.id.to_s
          }
        )
        self.stripe_source = stripe_source.id
        self.save!

        #send an email to the user which contains the link he has to click
        UserMailer.giropay_payment_request(buyer, self, stripe_source.redirect.url).deliver

      rescue => e
        #notify platform admins via sentry
        Raven.capture_exception(e)
      end
    else
      Raven.capture_message("Error: tried to trigger a payment transaction for an unknown payment method: #{self.payment_method}")
    end

  end

end
