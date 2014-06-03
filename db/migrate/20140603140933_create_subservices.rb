class CreateSubservices < ActiveRecord::Migration
  def change
    create_table :subservices do |t|
      t.text :text_fa
      t.text :text_en
      t.string :title_en
      t.string :title_fa

      t.timestamps
    end
  end
end
