class CartsController < ApplicationController
  before_action :checks, only: [:create]
  before_action :correct_customer,   only: :destroy
  skip_before_action :is_admin
  
  def create
   
    if @cart = current_customer.carts.find_by(item_id: params[:item_id].to_i)
      @cart.quantity = @cart.quantity + params[:quantity_to_add].to_i
    else
      @cart = current_customer.carts.build(customer_id: params[:customer_id], item_id: params[:item_id], quantity: params[:quantity_to_add].to_i)
    end
    inventory = Item.find(params[:item_id].to_i).inventory
    inventory.inventory_amount -= params[:quantity_to_add].to_i 
    if @cart.save && inventory.save
      flash[:success] = "Successfully added to cart!"
      redirect_to Item.find(params[:item_id].to_i)
    else
        error = "Uh oh! There was an error adding this to your cart."
        flash[:alert] = error
      render Item.find(params[:item_id].to_i)
    end
  end

  def update_cart
#     raise "r"
    if params.has_key?("cart")
        cart = current_customer.carts.find_by(id: params[:cart][:cart_id].to_i)
      diff = params[:cart][:quantity_to_add].to_i - cart.quantity
      new_amount = cart.item.inventory.inventory_amount - diff
      if cart.item.inventory.update_attributes(inventory_amount: new_amount)
      cart.update_attributes(quantity: params[:cart][:quantity_to_add].to_i)
      else
        flash[:alert] = "Uh oh! Looks like we don't have enough inventory to accomodate your order. Please try a lower quantity."
        redirect_to cart_url
      end
    end
    redirect_to cart_url
#     if  params.has_key? "cart_id"
#       cart = Cart.find(params[:cart_id])
#       item = cart.item
#       cart.delete
#       flash[:success] = "Please select your new quantity. Then click add to cart."
#       redirect_to item
#     else
#       flash[:alert] = "Something went wrong with editing your cart. Please try again."
#     redirect_to cart_url
#     end
  end
  
    def checks
      valid = true
      if !logged_in?
        valid = false
        error_2 = "You are not logged in."
      end
      if Item.find(params[:item_id]).inventory.inventory_amount < params[:quantity_to_add].to_i
        valid = false
        error_2 = "We do not have that many in stock. Please select a smaller amount. We apologize for the inconvenience."
      end
      if !valid
      error = "Uh oh! There was an error adding this to your cart."
      flash[:alert] = error+" "+error_2
      redirect_to Item.find(params[:item_id].to_i)
      end
      return valid
    end
  def destroy
    inventory = @cart.item.inventory
    inventory.update_attributes(inventory_amount: inventory.inventory_amount + @cart.quantity)
    @cart.destroy
    inventory = nil
    flash[:success] = "Item removed from cart successfully!"
    redirect_to cart_url
  end
  
  
  private
   def cart_params
     params.require(:cart).permit(:item_id, :customer_id, :quantity)
    end
  def correct_customer
    @cart = current_customer.carts.find_by(id: params[:id])
      redirect_to root_url if @cart.nil?
    end
end