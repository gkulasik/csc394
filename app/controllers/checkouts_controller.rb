class CheckoutsController < ApplicationController
  before_action :set_checkout, only: [:show, :edit, :update, :destroy]
  skip_before_action :is_admin, except: :index
  before_action :checkout_check, only: [:show, :edit, :update, :destroy]
  # GET /checkouts
  # GET /checkouts.json
  
  def checkout_check
    if !right_customer(current_customer.id, @checkout.customer_id)
      flash[:alert] = "Uh oh! You don't have authorization to go there."
      redirect_to root_path
      return
    end
  end
  
  
  def index
    @checkouts = Checkout.all
  end

  # GET /checkouts/1
  # GET /checkouts/1.json
  def show
    @carts = current_customer.carts
  end

  # GET /checkouts/new
  def new
    if current_customer.carts.empty?
      flash[:alert] = "You have no items in your cart to checkout with!"
      redirect_to cart_url
      return
    end
    @checkout = Checkout.new
  end

  # GET /checkouts/1/edit
  def edit
  end

  # POST /checkouts
  # POST /checkouts.json
  def create
    @checkout = Checkout.new(checkout_params)

    respond_to do |format|
      if @checkout.save
        format.html { redirect_to @checkout, notice: 'Please review your order before checking out.' }
        format.json { render :show, status: :created, location: @checkout }
      else
        format.html { render :new }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkouts/1
  # PATCH/PUT /checkouts/1.json
  def update
    respond_to do |format|
      if @checkout.update(checkout_params)
        format.html { redirect_to @checkout, notice: 'Checkout was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkout }
      else
        format.html { render :edit }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkouts/1
  # DELETE /checkouts/1.json
  def destroy
    @checkout.destroy
    respond_to do |format|
      format.html { redirect_to checkouts_url, notice: 'Checkout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkout
      @checkout = Checkout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkout_params
      params.require(:checkout).permit(:card_number, :csv, :name_on_card, :expiration_date, :shipping_address, :shipping_city, :shipping_state_or_province, :shipping_postal_code, :using_account_address, :verified, :customer_id, :order_summary_id, :shipping_country)
    end
end
