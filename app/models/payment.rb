class Payment < ApplicationRecord
  # RELATIONS
  belongs_to :user 
  belongs_to :loan

  # VALIDATIONS
  validates :user_id, :loan_id, :payment_amount, :date, presence: true

  def overdue?
    Time.now.to_date > self.loan.payment_date
  end

end
