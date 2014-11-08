class CustomerMailer < ActionMailer::Base
  default from: "gkulasik.developer@gmail.com", to: "gkulasik@gmail.com"
  #replace all gkulasik@gmail.com with @customer.email
  
  def sign_up_email(customer)
    @customer = customer
    mail(to: "gkulasik@gmail.com", subject: "Weclome to Ascent!")
  end
  
  def order_complete_email(order, customer, checkout)
    @order_summary = order
    @customer = customer
    @checkout = checkout
    
    
    mail(to: "gkulasik@gmail.com", subject: "Ascent Order Summary - #{Date.today}")
  end
end
