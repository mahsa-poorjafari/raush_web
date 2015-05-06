class AddEnFieldsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :education_en, :text
    add_column :teams, :job_field_en, :text
    add_column :teams, :ability_en, :text
    add_column :teams, :contact_info_en, :text
  end
end
