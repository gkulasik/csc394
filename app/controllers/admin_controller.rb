class AdminController < ApplicationController
  def home
  end
  
  #simple method to add all users to a variable ..maybe make another method to add only those that are logged in. Double check with Greg.
  def index
    @all_users = Customer.all
  end
  
  #method to add all items to a variable in order to iterate through later on
  def item_index
    @item_index = Item.all
  end
  

  
  
  ############################
  ####### Possible user index html form / this will be added to views, not in the controller, but could not comment out in the views. This will be where the "Current Customers or whatever" link will get to for admin to see current customers. Will also add .address , .email, and etc. 
  #Added TODO Friday night - update first admin users view to match up with the admin item view created below and also find out how to add the links at the end so that admin can update info, remove users, or add users through the admin pages gui and not just terminal. 
  ############################
  

#<h1>Admin Users View</h1>

#<ul class="users">
#  <% @all_users.each do |user| %>
#    <li>
#      <%= gravatar_for user, size: 50 %>
#      <%= link_to user.name, user %>
#    </li>
#  <% end %>
#</ul>
  #############################
  
  #############################
  ###### Same as above (except for the admin items view instead of admin users view, refine iteratively and contact Greg when compiled a list of problems and questions
  #############################
  
#  <h1>Admin Item Inventory</h1>
#  <table>
#    <tr>
#      <th>Item Description</th>
#      <th>Price</th>
#      <th>Qty. Available</th>
#      <th></th>
#      <th></th>
#      <th></th>
#    </tr>
    
#  <% @item_index.each do |item| %>
#    <tr>
#    <td><%= item.description %></td>
#    <td><%= item.item_price %></td>
#    <td><%= item.quantity %></td>
    #add a link to show the item in detail
    #add a link to edit or update the info of the item
    #add a link to remove an item
#    </tr>
#  <% end %>
#  </table>
  
  #create a break in the doc and possibly create a link here to send the admin to add a new item to the inventory

  ###############################
    
  
  
  
end
