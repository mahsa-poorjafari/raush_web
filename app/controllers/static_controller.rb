# encoding: UTF-8
class StaticController < ApplicationController
  def home
    @teams = Team.all
    @web = Service.find_by(title_en: "web")
  end
end
