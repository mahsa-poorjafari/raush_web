# encoding: UTF-8
class TariffOrder < ActiveRecord::Base
  belongs_to :order_online
  belongs_to :tariff_price
end
