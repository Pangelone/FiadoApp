class Payment < ApplicationRecord
  # RELATIONS
  belongs_to :user 
  belongs_to :loan

  # VALIDATIONS
  validates :user_id, :loan_id, :payment_amount, :date, presence: true

  def self.date_validation(p)
    today = Time.now.to_date
    payment_date = Loan.find_by(id: p[:loan_id]).payment_date

    today > payment_date
  end
end
