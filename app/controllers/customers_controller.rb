class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  
  #####
  #skip_before_action :is_admin, except: :index
  #### Lourance commented the above skip_before_action, because when it is included, the admin is not authorized to go into the customers view. Will inform Greg tomorrow to see if better solution available
  ##### Lourance added new skip_before_action below - same as above, confirm with Greg.
  
  skip_before_action :is_admin, except: [:index, :destroy]
  skip_before_action :is_logged_in, only: [:new, :show, :create]
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        log_in @customer
        CustomerMailer.sign_up_email(@customer).deliver
        flash[:success] = 'Your account was successfully created!'
        
        format.html { redirect_to edit_customer_path(@customer) }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to edit_customer_path(current_customer), notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def view_cart
    @carts = current_customer.carts.order("id ASC")
    @checkout_path = edit_checkout_path(current_customer.checkouts.find_by(verified: nil))  || new_checkout_url
    
  end
  def view_orders
    @orders = current_customer.order_summaries
  end
  def order_confirmation
   
    if create_order
    flash.now[:success] = "Order processed Successfully!"
      @order_summary = @order
      CustomerMailer.order_complete_email(@order_summary, current_customer, @order_summary.checkout).deliver
    else
      if current_customer.has_open_checkout?
        redirect_to customers_view_orders_path
      
      else
        
      flash.now[:alert] = "Error while processing order."
      redirect_to cart_url
      end
    end
    
    
    end
  
  def create_order
   
    if params.has_key?("verified") && params.has_key?("customer_id") && params.has_key?("checkout_id") && current_customer.has_open_checkout?
      
      if params[:customer_id].to_i == current_customer.id
        @everything_ok = true
        @order = OrderSummary.create(customer_id: current_customer.id, order_date: Date.today, total_cost: -1)
        if @order.nil?
          @everything_ok = false
          return "Error creating order. Please try again in a moment."
        end
        @cart = current_customer.carts
        total_cost = 0
        @cart.each do |c|
          @order.order_details.build(item_price: c.item.unit_price, item_id: c.item.id, quantity: c.quantity)
          total_cost += c.item.unit_price*c.quantity
#           raise 'e'
          c.destroy
        end
       
        @checkout = current_customer.checkouts.find(params[:checkout_id].to_i)
        @checkout.update_attributes(verified: params[:verified]) ? @everything_ok : @everything_ok = false
       
        @order.update_attributes(total_cost: total_cost)  ? @everything_ok : @everything_ok = false
        @checkout.update_attributes(order_summary_id: @order.id)  ? @everything_ok : @everything_ok = false
        if @everything_ok
          true
        else
          false
        end
#         raise "e"
      end
  end
end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :address, :city, :state_province, :postal_code, :country, :phone_number, :email, :password, :password_confirmation)
    end
  
  
