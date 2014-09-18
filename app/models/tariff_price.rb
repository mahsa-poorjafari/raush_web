# encoding: UTF-8
class TariffPrice < ActiveRecord::Base
  belongs_to :service
  has_many :tariff_orders
  
end
