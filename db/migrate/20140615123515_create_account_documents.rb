class CreateAccountDocuments < ActiveRecord::Migration
  def change
    create_table :account_documents do |t|
      t.date :payment_date
      t.integer :value
      t.integer :paid_to
      t.integer :paid_by
      t.integer :payment_group_id
      t.string :physical_factor_number
      t.text :description

      t.timestamps
    end
  end
end
