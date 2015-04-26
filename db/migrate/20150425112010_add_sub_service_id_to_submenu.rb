class AddSubServiceIdToSubmenu < ActiveRecord::Migration
  def change
    add_column :submenus, :subservice_id, :integer
  end
end
