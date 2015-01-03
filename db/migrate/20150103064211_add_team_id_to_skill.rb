class AddTeamIdToSkill < ActiveRecord::Migration
  def change
    add_column :skills, :team_id, :integer
  end
end
