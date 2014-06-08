class CreateCameraModels < ActiveRecord::Migration
  def change
    create_table :camera_models do |t|
      t.integer :subservice_id
      t.string :title_en
      t.string :title_fa

      t.timestamps
    end
  end
end
