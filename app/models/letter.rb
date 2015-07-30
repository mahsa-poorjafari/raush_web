# encoding: UTF-8
class Letter < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :letter_subject
  validates :letter_subject, :presence => {:message => 'فیلدهای ضروری را پر کنید'}
end
