# encoding: UTF-8
class AccountDocument < ActiveRecord::Base
  extend PersianNumbers
  persian_dates :payment_date
  belongs_to :payment_group  
  has_many :factor_details, :dependent => :destroy 
  accepts_nested_attributes_for :factor_details, :allow_destroy => true
end
