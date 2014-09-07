class AddStatusToAccountDocument < ActiveRecord::Migration
  def change
    add_column :account_documents, :status, :boolean, default: false
  end
end
