class OrderMailer < ActionMailer::Base
  def send_user_order
    @order = OrderOnline.last
    mail(:to =>  'raush.co@gmail.com', :subject => "Order Online from Site", :from => "web-development@raush.com")
  end
  def send_simple_message
    RestClient.post "https://api:key-a7da178ed347bb3edaf4453a3d5dd747"\
    "@api.mailgun.net/v3/sandboxbcaa54ee9afe4f25baf1f704855197ab.mailgun.org/messages",
    :from => "Mailgun Sandbox <postmaster@sandboxbcaa54ee9afe4f25baf1f704855197ab.mailgun.org>",
    :to => "Raush <raush.co@gmail.com>",
    :subject => "Hello Raush",
    :text => "Congratulations Raush, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
  end
end
