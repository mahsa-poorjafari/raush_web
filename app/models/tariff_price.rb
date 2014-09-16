# encoding: UTF-8
class TariffPrice < ActiveRecord::Base
  belongs_to :service
  has_many :tariff_orders
  has_many :order_onlines, :through => :tariff_orders
end
