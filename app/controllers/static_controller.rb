# encoding: UTF-8
class StaticController < ApplicationController
  def home    
    @aboutus = Page.find_by_title_en('About us')
  end
  
  def accounting
  end
  def sitemap
    respond_to do |format|
      format.xml
    end
  end
  def google46bde3a8d7d48d7d
  end
end
