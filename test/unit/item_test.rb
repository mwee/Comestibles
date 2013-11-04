require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "should calculate full price 3 * 5 = 15" do
    @item = FactoryGirl.create(:item)
    assert @item.full_price == 15
  end

  test "should calculate full price 2 * 100 = 200" do
    @item = FactoryGirl.create(:item, unit_price: 100, quantity: 2)
    assert @item.full_price == 200
  end

end