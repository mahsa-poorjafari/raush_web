# encoding: UTF-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception 
  before_filter :set_locale
  
  #before_filter :authenticate
  include SimpleCaptcha::ControllerHelpers
  protected
    def check_autentication
      redirect_to :root unless session[:admin].present?
    end
    def default_url_options
      { :locale => I18n.locale }
    end
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "raush" && password == "co"
      end
    end
    
  private
    def set_locale
      params[:locale] == "en" ?  I18n.locale = "en" : I18n.locale = "fa"
      Rails.application.routes.default_url_options[:locale] = I18n.locale 
    end   
end
