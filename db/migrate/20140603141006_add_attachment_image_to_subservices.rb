class AddAttachmentImageToSubservices < ActiveRecord::Migration
  def self.up
    change_table :subservices do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :subservices, :image
  end
end
