class AdminController < ApplicationController
  
  skip_before_action :is_admin
  
  

  ## Update Thursday Night - Created variable in method to select where ship_date is nil and also added an index with a parameters case for the filter, but not really sure where this should go, because I am thinking it will go into order_summaries_controller and not admin controller. Will ask Greg tomorrow morning and complete. Filter commented out below, because not sure if it is correct.
  
#<dl class="sub-nav">
#  <dt>Filter:</dt>
#  <dd role="menuitem"><%= link_to "All", order_summary%></dd>
#  <dd role="menuitem"><%= link_to "Unshipped Orders", order_summary_path(filter: "unshipped")%></dd>
#</dl>
#<br /><br />

  def unshipped_order
    @unshipped_orders = OrderSummary.where("ship_date = ?", nil)
  end
  
  def index
    case(params[:filter])
    when "unshipped"
      @unshipped_orders = OrderSummary.where("ship_date = ?", nil).order("order_date ASC")
    end
    
    
    
end

