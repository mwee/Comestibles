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

  # def return
  #   @notification = Twocheckout::ValidateResponse.purchase({:sid => 1817037, :secret => "tango", 
  #     :order_number => params['order_number'], :total => params['total'], :key => params['key']})

  #   @cart = Cart.find(params['merchant_order_id'])
  #   begin
  #     if @notification[:code] == "PASS"
  #       @cart.status = 'success'
  #       @cart.purchased_at = Time.now
  #       @order = Order.create(:total => params['total'],
  #         :card_holder_name => params['card_holder_name'],
  #         :status => 'pending',
  #         :order_number => params['order_number'])
  #       reset_session
  #       flash[:notice] = "Your order was successful! We will contact you directly to confirm before delivery."
  #       redirect_to root_url
  #     else
  #       @cart.status = "failed"
  #       flash[:notice] = "Error validating order, please contact us for assistance."
  #       redirect_to root_url
  #     end
  #     ensure
  #     @cart.save
  #   end
  # end
end
