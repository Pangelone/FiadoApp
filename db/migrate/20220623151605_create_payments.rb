class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :loan_id, :unsigned => true 
      t.integer :user_id, :unsigned => true 
      t.float :payment_amount
      t.date :date

      t.timestamps
    end
  end
end
