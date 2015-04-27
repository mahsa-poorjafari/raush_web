# encoding: UTF-8
class Customer < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title
  validates :title, :contract_start_date, :service_id, :presence => {:message => 'فیلدهای ضروری را پر کنید'}
  belongs_to :service
end
