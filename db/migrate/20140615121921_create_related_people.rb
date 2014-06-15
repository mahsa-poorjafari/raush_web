class CreateRelatedPeople < ActiveRecord::Migration
  def change
    create_table :related_people do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
