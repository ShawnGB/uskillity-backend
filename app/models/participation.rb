class Participation < ApplicationRecord
  belongs_to :workshop_session
  has_one :workshop, through: :workshop_session
  belongs_to :user
  has_one :payment_transaction, class_name: "Transaction"

  validates :workshop_session, presence: true
  validates :user, presence: true

  after_create :create_payment_transaction

  def create_payment_transaction
    #create transaction and trigger the charge
    transaction = Transaction.new(participation: self)
    transaction.save!
    transaction.make_charge
  end
end
