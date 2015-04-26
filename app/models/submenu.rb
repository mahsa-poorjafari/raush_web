# encoding: UTF-8
class Submenu < ActiveRecord::Base
  belongs_to :subservice
  def title
    I18n.locale == :fa ? self.read_attribute("title_fa") : self.read_attribute("title_en")
  end
end
