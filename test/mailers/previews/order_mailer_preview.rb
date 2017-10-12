class OrderMailerPreview < ActionMailer::Preview
  def order_mailer
    OrderMailer.order_mailer(Order.find(20))
  end
end