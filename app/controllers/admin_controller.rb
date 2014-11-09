class AdminController < ApplicationController
  
  skip_before_action :is_admin
  
  def home
  end
  
  #simple method to add all users to a variable ..maybe make another method to add only those that are logged in. Double check with Greg.
  #Update Saturday - does not seem I need this as the views were already created, I had overthought what my tasks were. All except the below method deleted, and will probably delete as well, bcause not in use. 
  def index
    @all_users = Customer.all
  end

    
  
  
  
end
