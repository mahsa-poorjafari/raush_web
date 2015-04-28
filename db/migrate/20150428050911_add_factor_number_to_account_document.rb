class AddFactorNumberToAccountDocument < ActiveRecord::Migration
  def change
    add_column :account_documents, :factor_number, :string
  end
end
