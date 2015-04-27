# encoding: UTF-8
class Service < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_fa
  has_attached_file :image, :styles => { :large => "500x500>" , :medium => "300x300>", :small => "200x200>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"],
                                            :message =>  "فرمت عکس صحیح نیست"
  
  validates :title_en, :title_fa, :uniqueness => {:message => 'عنوان تکراری است'}
  validates :title_en, :title_fa, :presence => {:message => 'عنوان را وارد کنید.'}
  has_many :pictures
  has_many :portfolios
  has_many :subservices
  has_many :tariff_prices
  has_many :customers
  
  def title
    I18n.locale == :fa ? self.read_attribute("title_fa") : self.read_attribute("title_en")
  end
  
  def description
    I18n.locale == :fa ? self.read_attribute("description_fa") : self.read_attribute("description_en")
  end
end
