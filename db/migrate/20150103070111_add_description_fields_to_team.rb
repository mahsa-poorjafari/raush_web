class AddDescriptionFieldsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :description_en, :text
    add_column :teams, :description_fa, :text
  end
end
