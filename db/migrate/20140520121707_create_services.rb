class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title_en
      t.string :title_fa
      t.string :description_en
      t.string :description_fa

      t.timestamps
    end
  end
end
