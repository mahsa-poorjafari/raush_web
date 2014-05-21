class OrderMailer < ActionMailer::Base
  def send_user_order
    @order = OrderOnline.last
    mail(:to =>  'raush.co@gmail.com', :subject => "Order Online from Site", :from => "web-development@raush.com")
  end
end
