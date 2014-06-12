class AddInProductionToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :in_production, :boolean
  end
end
