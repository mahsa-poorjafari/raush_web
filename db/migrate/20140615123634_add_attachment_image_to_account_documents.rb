class AddAttachmentImageToAccountDocuments < ActiveRecord::Migration
  def self.up
    change_table :account_documents do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :account_documents, :image
  end
end
