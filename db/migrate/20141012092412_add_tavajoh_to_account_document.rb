class AddTavajohToAccountDocument < ActiveRecord::Migration
  def change
    add_column :account_documents, :tavajoh, :string
  end
end
