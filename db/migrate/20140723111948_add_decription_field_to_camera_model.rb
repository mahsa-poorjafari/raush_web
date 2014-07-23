class AddDecriptionFieldToCameraModel < ActiveRecord::Migration
  def change
    add_column :camera_models, :description_en, :string
    add_column :camera_models, :description_fa, :string
  end
end
