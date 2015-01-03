class AddAttachmentIconToSkills < ActiveRecord::Migration
  def self.up
    change_table :skills do |t|
      t.attachment :icon
    end
  end

  def self.down
    drop_attached_file :skills, :icon
  end
end
