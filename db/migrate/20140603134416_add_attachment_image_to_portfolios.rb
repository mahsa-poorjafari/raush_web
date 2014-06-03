class AddAttachmentImageToPortfolios < ActiveRecord::Migration
  def self.up
    change_table :portfolios do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :portfolios, :image
  end
end
