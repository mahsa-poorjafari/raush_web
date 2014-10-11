class AddTakhfifFieldToAccountDocuments < ActiveRecord::Migration
  def change
    add_column :account_documents, :takhfif_precent, :integer
    add_column :account_documents, :takhfif_title, :string
    add_column :account_documents, :takhfif_amount, :integer
  end
end
