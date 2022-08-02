class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.integer :user_id, :unsigned => true 
      t.float :amount
      t.float :installment_amount
      t.date :payment_date

      t.timestamps
    end
  end
end
