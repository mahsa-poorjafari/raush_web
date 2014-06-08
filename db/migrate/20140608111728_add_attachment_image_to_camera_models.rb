class AddAttachmentImageToCameraModels < ActiveRecord::Migration
  def self.up
    change_table :camera_models do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :camera_models, :image
  end
end
