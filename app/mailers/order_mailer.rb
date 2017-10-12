class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  layout 'mailer'

  def order_mailer(order)
    @order = order
    mail(to: @order.email, subject: "Order # #{order.id}")
  end
end
