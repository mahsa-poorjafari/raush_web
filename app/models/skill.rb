# encoding: UTF-8
class Skill < ActiveRecord::Base
  has_attached_file :icon, :styles => { :large => "500x500>" , :medium => "300x300>", :icon => "50x50>" }
  validates_attachment_content_type :icon, :content_type => ["image/jpg", "image/jpeg", "image/png"],
                                            :message =>  "فرمت عکس صحیح نیست"
  belongs_to :team
end
