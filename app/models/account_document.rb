class AccountDocument < ActiveRecord::Base
  extend PersianNumbers
  persian_dates :payment_date
  belongs_to :payment_group
  belongs_to :related_people, foreign_key: "paid_to"
  belongs_to :related_people, foreign_key: "paid_by"
    
 
end
