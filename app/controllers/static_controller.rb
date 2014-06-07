# encoding: UTF-8
class StaticController < ApplicationController
  def home
    @teams = Team.all

    @web = Service.find_by(title_en: "web")    
    @graphic = Service.find_by(title_en: "graphic")    
    @bms = Service.find_by(title_en: "bms") 
    @network = Service.find_by(title_en: "network") 
    @camera = Service.find_by(title_en: "camera") 
    if @web
      @web_demos = Portfolio.where(:service_id => @web.id)
    end
    if @graphic
      @graphic_demos = Portfolio.where(:service_id => @graphic.id)
    end
    if @bms
      @hotel = @bms.subservices.find_by(title_en: "Smart Hotel")
      @house = @bms.subservices.find_by(title_en: "Smart House")
      @office = @bms.subservices.find_by(title_en: "Smart Office")
    end
    if @network
      @wan = @network.subservices.find_by(title_en: "WAN")
      @lan = @network.subservices.find_by(title_en: "LAN")
      @voip = @network.subservices.find_by(title_en: "VOIP")
    end
  end
end
