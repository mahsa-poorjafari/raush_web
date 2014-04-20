class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :last_name
      t.string :post

      t.timestamps
    end
  end
end
