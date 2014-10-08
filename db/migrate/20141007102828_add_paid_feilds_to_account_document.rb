class AddPaidFeildsToAccountDocument < ActiveRecord::Migration
  def change
    add_column :account_documents, :paid_to, :string
    add_column :account_documents, :paid_by, :string
  end
end
