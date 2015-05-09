class AddPrimaryValueToAccountDocument < ActiveRecord::Migration
  def change
    add_column :account_documents, :primary_value, :integer
  end
end
