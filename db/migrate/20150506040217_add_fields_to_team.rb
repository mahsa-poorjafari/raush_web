class AddFieldsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :education, :text
    add_column :teams, :job_field, :text
    add_column :teams, :ability, :text
    add_column :teams, :contact_info, :text
  end
end
