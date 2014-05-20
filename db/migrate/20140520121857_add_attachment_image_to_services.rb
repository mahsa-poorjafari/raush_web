class AddAttachmentImageToServices < ActiveRecord::Migration
  def self.up
    change_table :services do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :services, :image
  end
end
