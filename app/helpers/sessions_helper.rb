module SessionsHelper
  
  def log_in(customer)
    session[:customer_id] = customer.id
  end
  def current_customer
#     in order to prevent multiple databse hits we do an if statement that will create a new variable and store the curent user
    if @current_customer.nil?
      @current_customer =  Customer.find_by(id: session[:customer_id])
    else
      @current_customer
    end 
#     can be written as 
#     @current_customer ||= Customer.find_by(id: session[:customer_id])
  end
  
  def logged_in?
    !current_customer.nil?
  end
#   def logged_in_admin?
  #     return !@current_customer.nil? && @current_customer.admin?
#   end
  
  def log_out
    session.delete(:customer_id)
    @current_customer = nil
  end
end
