class AddOrderFieldToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :set_order, :integer
  end
end
