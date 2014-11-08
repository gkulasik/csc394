module SessionsHelper
  
  def log_in(customer)
#     logs in the customer by putting their ID in a session within the browser
    session[:customer_id] = customer.id
  end
  def current_customer
    #     This method is a helper method that allows you to see who is currently logged in, use: current_customer (anywhere in the application)
#     The method returns the customer who is currently logged in as a Customer object
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
#     checks if a customer is logged in, use: logged_in? this will only validate if a customer is logged in but will not tell you if they are an admin or regular customer
#     The method returns true is logged in, false if not logged in 
    !current_customer.nil?
  end
  
  def logged_in_admin?
      return !current_customer.nil? && current_customer.admin?
  end
  
  def log_out
#     logs a customer out by deleteing the cusotmers id within the session
    
    session.delete(:customer_id)
    @current_customer = nil
  end
end
