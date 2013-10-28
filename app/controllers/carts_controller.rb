class CartsController < ApplicationController

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
      flash[:notice] = "Successfully created a new cart."
      redirect_to @cart
    else
      render :action => 'new'
    end
  end

  def update
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end


  def finalize
    @cart = Cart.find(params[:id])
    if @cart.update_attribute(:finalized, true)
      redirect_to @cart
    else
     render @cart
    end 
  end


end
