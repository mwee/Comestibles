class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    # @item = Item.new
    # @cart = Cart.find(params[:cart_id])

    @cart = Cart.find(params[:cart_id])
    @item = @cart.items.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @cart = Cart.find(params[:cart_id])
    # @item = Item.new(item_params)

    @item = @cart.items.create(item_params)
    
    redirect_to @cart

    # if @item.save
    #   redirect_to @item, notice: 'Item was successfully created.'
    # else
    #   render action: 'new'
    # end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name, :unit_price, :quantity, :category_id, :cart_id)
    end
end
