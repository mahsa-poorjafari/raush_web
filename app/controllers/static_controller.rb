# encoding: UTF-8
class StaticController < ApplicationController
  before_filter :send_daily_email
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
  def send_daily_email
    @today_1_month = Date.today + 1.month
    @today_1_month = JalaliDate.new(@today_1_month).strftime("%Y-%m-%d")
    
    @customers = Customer.all
    @customers.each do |customer|
     
      @customer_start_date = JalaliDate.new(customer.contract_start_date).strftime("%Y-%m-%d")
      if @customer_start_date == @today_1_month 
        OrderMailer.send_deadline_alarm(customer).deliver
       
      end
    end
  end
 
end
