class CartsController < ApplicationController
  before_action :checks, only: [:create]
  before_action :correct_customer,   only: :destroy
  def create
    @cart = current_customer.carts.build(customer_id: params[:customer_id], item_id: params[:item_id], quantity: params[:quantity_to_add].to_i)
    if @cart.save
      flash[:success] = "Successfully added to cart!"
      redirect_to Item.find(params[:item_id].to_i)
    else
        error = "Uh oh! There was an error adding this to your cart."
        flash[:alert] = error
      render Item.find(params[:item_id].to_i)
    end
  end

  def update_cart
    if  params.has_key? "cart_id"
      cart = Cart.find(params[:cart_id])
      item = cart.item
      cart.delete
      flash[:success] = "Please select your new quantity. Then click add to cart."
      redirect_to item
    else
      flash[:alert] = "Something went wrong with editing your cart. Please try again."
    redirect_to cart_url
    end
  end
  
    def checks
      valid = true
      if !logged_in?
        valid = false
        error_2 = "You are not logged in."
      end
      if Item.find(params[:item_id]).inventory.inventory_amount < params[:quantity_to_add].to_i
        valid = false
        error_2 = "We do not have that many in stock. We apologize for the inconvenience."
      end
      if !valid
      error = "Uh oh! There was an error adding this to your cart."
      flash[:alert] = error+" "+error_2
      redirect_to Item.find(params[:item_id].to_i)
      end
      return valid
    end
  def destroy
    @cart.destroy
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