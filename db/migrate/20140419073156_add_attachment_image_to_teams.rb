class AddAttachmentImageToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :teams, :image
  end
end
