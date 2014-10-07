# encoding: UTF-8
class TariffPrice < ActiveRecord::Base
  
  belongs_to :service
  has_many :tariff_orders
  def modual
    I18n.locale == :fa ? self.read_attribute("modual") : self.read_attribute("modual_en")
  end
  
end
