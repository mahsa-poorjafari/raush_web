# encoding: UTF-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception 
  before_filter :set_locale
  
  protected
    def check_autentication
      redirect_to :root unless session[:admin].present?
    end
    def default_url_options
      { :locale => I18n.locale }
    end
  private
    def set_locale
      params[:locale] == "fa" ?  I18n.locale = "fa" : I18n.locale = "en"
      Rails.application.routes.default_url_options[:locale] = I18n.locale 
    end   
end
