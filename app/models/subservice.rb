# encoding: UTF-8
class Subservice < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_fa
  belongs_to :service
  has_many :camera_models
  has_many :submenus
  validates :service_id, :presence => {:message => 'فیلدهای ضروری را پر کنید'}
  has_attached_file :image, :styles => { :large => "500x500>" , :medium => "300x300>", :small => "200x200>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"],
                                            :message =>  "فرمت عکس صحیح نیست"
  has_attached_file :icon, :styles => { :large => "500x500>" , :medium => "300x300>", :small => "150x150>" }
  validates_attachment_content_type :icon, :content_type => ["image/jpg", "image/jpeg", "image/png"],
                                            :message =>  "فرمت عکس صحیح نیست"
  
  
  def title
    I18n.locale == :fa ? self.read_attribute("title_fa") : self.read_attribute("title_en")
  end
  
  def text
    I18n.locale == :fa ? self.read_attribute("text_fa") : self.read_attribute("text_en")
  end                                          
  
end
