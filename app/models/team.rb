# encoding: UTF-8
class Team < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "150x500>" , :medium => "200x500>", :small => "50x200>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  
  has_many :skills
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  def description
    I18n.locale == :fa ? self.read_attribute("description_fa") : self.read_attribute("description_en")
  end
  def education
    I18n.locale == :fa ? self.read_attribute("education") : self.read_attribute("education_en")
  end
  def job_field
    I18n.locale == :fa ? self.read_attribute("job_field") : self.read_attribute("job_field_en")
  end
  def ability
    I18n.locale == :fa ? self.read_attribute("ability") : self.read_attribute("ability_en")
  end
  def contact_info
    I18n.locale == :fa ? self.read_attribute("contact_info") : self.read_attribute("contact_info_en")
  end
end
