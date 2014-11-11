class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :is_admin, except: [:edit, :create, :destroy, :new]
  skip_before_action :is_logged_in, only: [:show, :index]
  

  # GET /items
  # GET /items.json
  def index
    if logged_in_admin?
      per = 30
    else
      per = 9
    end
    case(params[:filter])
    when "newest"
      @items = Item.last(10)
    when "best_seller"
      @items = Item.all.sample(10)
    when "deals"
      @items = Item.all.sample(10)
    when "sort"
      case params[:sorting]
        when "hi_to_lo"
        @items = Item.search(params[:search]).order("unit_price DESC").page(params[:page]).per(per)
        when "lo_to_hi"
        @items = Item.search(params[:search]).order("unit_price ASC").page(params[:page]).per(per)
      else
         @items = Item.search(params[:search]).page(params[:page]).per(per)
      end
    else
      @items = Item.search(params[:search]).page(params[:page]).per(per)
    end
    if @items.empty?
      flash.now[:alert] = "Uh oh! We didn't find any thing for that search. Please try again."
      params[:search] = ""
       @items = Item.all.page(params[:page]).per(per)
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @images = @item.images
    @inventory = @item.inventory.inventory_amount
    @cart = @item.carts.build
    @might_like = Item.all.sample(10)
  end

  # GET /items/new
  def new
    @item = Item.new
   @image =  @item.images.build
    @inventory = @item.build_inventory
  end

  # GET /items/1/edit
  def edit
    
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    #@image = @item.images.build(item_params[:image_attributes])
    @inventory = @item.build_inventory(item_params[:inventory_attributes])
    respond_to do |format|
      if @item.save && @inventory.save
       if params[:images]

          params[:images].each { |image|
            @item.images.create(img: image)
          }
        end
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params) && @item.inventory.update_attributes(inventory_amount: item_params[:inventory_attributes][:inventory_amount])
        if params[:images]

          params[:images].each { |image|
            @item.images.create(img: image)
          }
        end
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def delete_image
    if params.has_key? "image_id"
      
      image = Image.find_by(id: params[:image_id].to_i)
      item = image.picture
      image.delete
      flash[:success] = "Image deleted"
      redirect_to edit_item_path(item)
      
    else
      flash[:alert] = "Something went wrong with image deletion. Please try again."
      redirect_to :back
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through. [:id, :name, :_destroy]
    def item_params
      params.require(:item).permit(:description, :keywords, :unit_price, :title, :picture, inventory_attributes: [:id, :inventory_amount, :_destroy])
    end
end
