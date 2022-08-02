class Loan < ApplicationRecord
  # RELATIONS
  belongs_to :user 
  has_many :payments

  # VALIDATIONS
  validates :user_id, :amount, :installment_amount, :payment_date, presence: true
end
