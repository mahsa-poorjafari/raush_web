class CreateFactorDetails < ActiveRecord::Migration
  def change
    create_table :factor_details do |t|
      t.string :object_name
      t.string :number_of
      t.integer :objecct_price
      t.integer :object_amount
      t.integer :account_document_id

      t.timestamps
    end
  end
end
