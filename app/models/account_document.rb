# encoding: UTF-8
class AccountDocument < ActiveRecord::Base
  extend PersianNumbers
  persian_dates :payment_date
  belongs_to :payment_group
  belongs_to :related_people, foreign_key: "paid_to"
  belongs_to :related_people, foreign_key: "paid_by"
  has_many :factor_details, :dependent => :destroy 
  accepts_nested_attributes_for :factor_details, :allow_destroy => true
end
