class Donation < ApplicationRecord
  belongs_to :user

  validates_presence_of :method, :amount
  validates_presence_of :payment_date, if: :paid
end
