class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_action :is_admin
  before_action :is_logged_in
  
  def is_admin
    if is_logged_in
    if !current_customer.admin
      flash[:alert] = "You are not authorized to access this page, please log in to admin account"
      redirect_to login_url
    end
  end
    
  end
  
  def is_logged_in
    if current_customer.nil?
      flash[:alert] = "You need to log in before you can proceed"
      redirect_to login_url
      false
    else
      true
    end
  end
 
  
  
      
  

end
