class AdminController < ApplicationController
  
  skip_before_action :is_admin
  
  

  ## Update Thursday Night - Created variable in method to select where ship_date is nil and also added an index with a parameters case for the filter, but not really sure where this should go, because I am thinking it will go into order_summaries_controller and not admin controller. Will ask Greg tomorrow morning and complete. Filter commented out below, because not sure if it is correct.
  


  def unshipped_orders
    @unshipped_orders = OrderSummary.where("ship_date IS NULL").order('total_cost DESC')
  end
  
    
    
end

