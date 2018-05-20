class Order < ApplicationRecord
  has_many :participations
  has_one :payment_transaction, class_name: "Transaction"

  def trigger_payment_transaction
    return unless self.payment_transaction.nil?
    # depending on payment_method of participation, either:
    # create a transaction and directly charge it (if creditcard)
    # or create a transaction for giropay
    #create transaction and trigger the charge
    transaction = Transaction.new(order: self)
    transaction.save!
    if self.payment_method == "creditcard"
      transaction.make_charge
    elsif self.payment_method == "giropay"
      # create stripe source, send email to user
    else
      # TODO: raise exception??
    end
  end

end
