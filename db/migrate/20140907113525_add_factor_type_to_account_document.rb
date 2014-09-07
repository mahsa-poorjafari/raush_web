class AddFactorTypeToAccountDocument < ActiveRecord::Migration
  def change
    add_column :account_documents, :factor_type, :string
  end
end
