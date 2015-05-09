# encoding: UTF-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception 
  before_filter :set_locale
  before_filter :send_daily_email
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
    def send_daily_email
      
      @today = JalaliDate.new(Date.today).strftime("%Y-%m-%d")
      
      @customers = Customer.all
      @customers.each do |customer|
       
        @customer_start_date = JalaliDate.new(customer.contract_start_date).strftime("%Y-%m-%d")
        if @customer_start_date == @today.1.mounth
          OrderMailer.send_deadline_alarm(customer).deliver
         
        end
      end
    end
  private
    def set_locale
      params[:locale] == "en" ?  I18n.locale = "en" : I18n.locale = "fa"
      Rails.application.routes.default_url_options[:locale] = I18n.locale 
    end   
end
