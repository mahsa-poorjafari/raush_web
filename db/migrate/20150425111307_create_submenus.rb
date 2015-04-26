class CreateSubmenus < ActiveRecord::Migration
  def change
    create_table :submenus do |t|
      t.string :title_en
      t.string :title_fa

      t.timestamps
    end
  end
end
