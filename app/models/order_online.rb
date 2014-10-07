# encoding: UTF-8
class OrderOnline < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :name
  has_many :tariff_orders
  has_many :tariff_prices, :through => :tariff_orders
  
  validates :email,  :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'ایمیل نامعتبر است.' }   
  validates :name, :email, :mobile, :presence => {:message => 'فیلدهای ضروری را پر کنید.'}
  
end

