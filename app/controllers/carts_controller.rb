class CartsController < ApplicationController
  before_action :set_group

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def new
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(params[:cart])

    if @cart.save
      @group_cart = GroupCart.new(cart_id: @cart.id, group_id: @group.id)
      if @group_cart.save
        flash[:notice] = "Successfully created a new cart."
        redirect_to group_carts_url(group_id: @group.id)
      else 
        flash[:error] = "Could not create association"
        render :action => 'new'
      end  
    else
      render :action => 'new'
    end
  end

  def update
    @cart = Cart.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:group_id])
    @cart = Cart.find(params[:id])
    @cart.destroy
    flash[:notice] = "Successfully destroyed cart."
    redirect_to group_carts_path(@group, @cart)
  end

  def finalize
    @group = Group.find(params[:group_id])
    @cart = Cart.find(params[:cart_id])
    if @cart.update_attribute(:finalized, true)
      redirect_to group_carts_path(@group, @cart)
    else
     render group_carts_path(@group, @cart)
    end 
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end



end
