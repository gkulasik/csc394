class OrderSummariesController < ApplicationController
  before_action :set_order_summary, only: [:show, :edit, :update, :destroy]
  skip_before_action :is_admin
  
  # GET /order_summaries
  # GET /order_summaries.json
  def index
    @order_summaries = OrderSummary.all
  end

  # GET /order_summaries/1
  # GET /order_summaries/1.json
  def show
    @checkout = @order_summary.checkout
  end

  # GET /order_summaries/new
  def new
    @order_summary = OrderSummary.new
  end

  # GET /order_summaries/1/edit
  def edit
  end

  # POST /order_summaries
  # POST /order_summaries.json
  def create
    @order_summary = OrderSummary.new(order_summary_params)

    respond_to do |format|
      if @order_summary.save
        
        flash[:success] = 'Order was successfully processed!'
        format.html { redirect_to @order_summary }
        format.json { render :show, status: :created, location: @order_summary }
      else
        format.html { render :new }
        format.json { render json: @order_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_summaries/1
  # PATCH/PUT /order_summaries/1.json
  def update
    respond_to do |format|
      if @order_summary.update(order_summary_params)
        format.html { redirect_to @order_summary, notice: 'Order summary was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_summary }
      else
        format.html { render :edit }
        format.json { render json: @order_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_summaries/1
  # DELETE /order_summaries/1.json
  def destroy
    @order_summary.destroy
    respond_to do |format|
      format.html { redirect_to order_summaries_url, notice: 'Order summary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_summary
      @order_summary = OrderSummary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_summary_params
      params.require(:order_summary).permit(:customer_id, :order_date, :ship_date, :total_cost)
    end
end
