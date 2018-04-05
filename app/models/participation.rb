class Participation < ApplicationRecord
  belongs_to :workshop_session
  belongs_to :user
  has_one :payment_transaction, class_name: "Transaction"

  validates :workshop_session, presence: true
  validates :user, presence: true

  after_create do
    #TODO create transaction and trigger the charge
    transaction = Transaction.new(participation: self)
    transaction.make_charge
  end
end
