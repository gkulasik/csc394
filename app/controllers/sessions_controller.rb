class SessionsController < ApplicationController
  skip_before_action :is_logged_in, :is_admin
  
  def new
#     if current_customer
#       flash[:notice] = "You are already logged in."
#       redirect_to root_url
#     end
  end
  
  def create
#     This method create a user session by authenitcating against the email and password
    user = Customer.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Logged in successfully"
      redirect_to root_url
    else 
      flash.now[:alert] = "Invalid email or password"
    render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
