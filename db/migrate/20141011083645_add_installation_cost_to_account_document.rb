class AddInstallationCostToAccountDocument < ActiveRecord::Migration
  def change
    add_column :account_documents, :installation_cost_title, :string
    add_column :account_documents, :installation_cost_precent, :integer
    add_column :account_documents, :installation_cost, :integer
  end
end
