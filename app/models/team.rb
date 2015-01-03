# encoding: UTF-8
class Team < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "150x500>" , :medium => "200x500>", :small => "50x200>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  
  has_many :skills
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  def description
    I18n.locale == :fa ? self.read_attribute("description_fa") : self.read_attribute("description_en")
  end
end
