class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title_fa
      t.string :title_en
      t.text :text_fa
      t.text :text_en

      t.timestamps
    end
  end
end
