# encoding: UTF-8
class Portfolio < ActiveRecord::Base
  
  belongs_to :service
  has_attached_file :image, :styles => { :large => "500x500>" , :medium => "400x400>", :small => "300x300>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"],
                                            :message =>  "فرمت عکس صحیح نیست"

   def title
    I18n.locale == :fa ? self.read_attribute("title_fa") : self.read_attribute("title_en")
  end
  
  def description
    I18n.locale == :fa ? self.read_attribute("description_fa") : self.read_attribute("description_en")
  end
end
