class RemovePaidFeildsFromAccountDocument < ActiveRecord::Migration
  def change
    remove_column :account_documents, :paid_to, :integer
    remove_column :account_documents, :paid_by, :integer
  end
end
