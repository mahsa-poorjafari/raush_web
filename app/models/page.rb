class Page < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_fa
  def title
    I18n.locale == :fa ? self.read_attribute("title_fa") : self.read_attribute("title_en")
  end
  
  def text
    I18n.locale == :fa ? self.read_attribute("text_fa") : self.read_attribute("text_en")
  end
end
