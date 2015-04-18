class AddAttachmentPdfToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :pages, :pdf
  end
end
