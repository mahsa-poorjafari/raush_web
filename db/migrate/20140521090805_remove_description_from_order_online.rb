class RemoveDescriptionFromOrderOnline < ActiveRecord::Migration
  def change
    remove_column :order_onlines, :description, :text
  end
end
