# encoding: UTF-8
class Subservice < ActiveRecord::Base
  belongs_to :service
  
  has_attached_file :image, :styles => { :large => "500x500>" , :medium => "300x300>", :small => "200x200>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"],
                                            :message =>  "فرمت عکس صحیح نیست"
                                            
  def title
    I18n.locale == :fa ? self.read_attribute("title_fa") : self.read_attribute("title_en")
  end
  
  def text
    I18n.locale == :fa ? self.read_attribute("text_fa") : self.read_attribute("text_en")
  end                                          
  
end
