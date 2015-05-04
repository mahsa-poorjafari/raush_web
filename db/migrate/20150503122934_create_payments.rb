class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :account_document_id
      t.integer :payment_amount
      t.integer :payment_type
      t.date :payment_date
      t.text :description

      t.timestamps
    end
  end
end
