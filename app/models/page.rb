# encoding: UTF-8
class Page < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_fa
  has_attached_file :pdf,
                    :url  => "/assets/circulars/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/circulars/:id/:style/:basename.:extension"
  validates_attachment_content_type :pdf,
      :content_type => [ 'application/pdf' ],
      :message => "نوع فایل نامعتبر است. فقط فایل پی دی اف مجاز است."
  def title
    I18n.locale == :fa ? self.read_attribute("title_fa") : self.read_attribute("title_en")
  end
  
  def text
    I18n.locale == :fa ? self.read_attribute("text_fa") : self.read_attribute("text_en")
  end
end
