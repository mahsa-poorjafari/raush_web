class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :title
      t.date :contract_start_date
      t.date :contract_end_date
      t.text :description
      t.integer :service_id

      t.timestamps
    end
  end
end
