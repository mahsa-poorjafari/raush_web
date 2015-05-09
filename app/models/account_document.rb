# encoding: UTF-8
class AccountDocument < ActiveRecord::Base
  extend PersianNumbers
  persian_dates :payment_date
  belongs_to :payment_group  
  has_many :factor_details, :dependent => :destroy 
  has_many :payments, :dependent => :destroy 
  accepts_nested_attributes_for :factor_details, :allow_destroy => true
  accepts_nested_attributes_for :payments, :allow_destroy => true
  has_attached_file :scan_file,
                    :url  => "/assets/circulars/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/circulars/:id/:style/:basename.:extension"
  validates_attachment_content_type :scan_file,
      :content_type => [ 'application/pdf' ],
      :message => "نوع فایل نامعتبر است. فقط فایل پی دی اف مجاز است.",
      :size => { :in => 0..300.kilobytes , :message => "حجم تصویر بیشتر از 300 کیلوبایت است."}
end
