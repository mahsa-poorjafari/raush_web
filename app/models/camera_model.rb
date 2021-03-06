# encoding: UTF-8
class CameraModel < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "500x500>" , :medium => "300x300>", :small => "200x200>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"],
                                            :message =>  "فرمت عکس صحیح نیست"
  validates :subservice_id, :presence => {:message => 'مدل دوربین را انتخاب کنید.'}
  belongs_to :subservice
  
  def title
    I18n.locale == :fa ? self.read_attribute("title_fa") : self.read_attribute("title_en")
  end
  def description
    I18n.locale == :fa ? self.read_attribute("description_fa") : self.read_attribute("description_en")
  end
  
  def funky_method
    "#{self.company_name}.camelize"
  end
end
