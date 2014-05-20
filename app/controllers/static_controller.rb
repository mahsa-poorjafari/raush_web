# encoding: UTF-8
class StaticController < ApplicationController
  def home
    @teams = Team.all
  end
end
