# encoding: UTF-8
class StaticController < ApplicationController
  def home
    @teams = Team.all
    @web = Service.find_by(title_en: "web")    
    @graphic = Service.find_by(title_en: "graphic")    
    if @web
      @web_demos = Portfolio.where(:service_id => @web.id)
    end
    if @graphic
      @graphic_demos = Portfolio.where(:service_id => @graphic.id)
    end
  end
end
