class AddAttachmentIconToSubservices < ActiveRecord::Migration
  def self.up
    change_table :subservices do |t|
      t.attachment :icon
    end
  end

  def self.down
    drop_attached_file :subservices, :icon
  end
end
