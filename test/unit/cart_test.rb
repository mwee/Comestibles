require 'test_helper'

class CartTest < ActiveSupport::TestCase
 
  test "should calculate total cart bill 15 + 200 = 215" do
    @item = FactoryGirl.create(:item, unit_price: 100, quantity: 2)
    assert @item.full_price == 200

    @item = FactoryGirl.create(:item, id: 1)
    assert @item.full_price == 15
  	
  	@cart = FactoryGirl.create(:cart)
  	assert @cart.total_price == 215
  end

end
