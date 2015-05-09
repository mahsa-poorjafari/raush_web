class AddAttachmentScanFileToAccountDocuments < ActiveRecord::Migration
  def self.up
    change_table :account_documents do |t|
      t.attachment :scan_file
    end
  end

  def self.down
    remove_attachment :account_documents, :scan_file
  end
end
