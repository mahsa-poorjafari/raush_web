
# encoding: UTF-8
class Contact < ActiveRecord::Base
  def self.search(search)
    search_condition = "%" + search + "%"  
    find(:all, :conditions => ['preson_name LIKE ? OR company_name LIKE ?', search_condition, search_condition])
  end
end
