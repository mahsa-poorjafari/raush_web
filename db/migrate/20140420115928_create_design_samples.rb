class CreateDesignSamples < ActiveRecord::Migration
  def change
    create_table :design_samples do |t|
      t.string :name
      t.text :website
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
