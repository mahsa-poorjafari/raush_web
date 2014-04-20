class AddAttachmentImageToDesignSamples < ActiveRecord::Migration
  def self.up
    change_table :design_samples do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :design_samples, :image
  end
end
