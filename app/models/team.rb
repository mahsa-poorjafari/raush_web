# encoding: UTF-8
class Team < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "150x500>" , :medium => "200x500>", :small => "50x200>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
