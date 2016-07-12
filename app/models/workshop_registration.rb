class WorkshopRegistration < ApplicationRecord
  enum status: {cancelled: 0, pending_payment: 1, successful: 2}
  belongs_to :workshop
  belongs_to :user
  belongs_to :booking
end
