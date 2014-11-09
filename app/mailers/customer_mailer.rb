class CustomerMailer < ActionMailer::Base
  default from: "gkulasik.developer@gmail.com" #, to: "gkulasik@gmail.com"
  
  
  def sign_up_email(customer)
    @customer = customer
    mail(to: @customer.email, subject: "Weclome to Ascent!")
  end
  
  def order_complete_email(order, customer, checkout)
    @order_summary = order
    @customer = customer
    @checkout = checkout
    
    
    mail(to: @customer.email, subject: "Ascent Order Summary - #{Date.today}")
  end
end
