# encoding: UTF-8
class Payment < ActiveRecord::Base
  extend PersianNumbers
  persian_dates :payment_date
  belongs_to :account_document
end
