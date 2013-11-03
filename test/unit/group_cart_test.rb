require 'test_helper'

class GroupCartTest < ActiveSupport::TestCase
    test "groups should initially have no carts; can have some" do
       @group = FactoryGirl.create(:group)
       @cart1 = FactoryGirl.create(:cart)
       assert @group.lists.length == 0, "initially have no carts"

       @group_cart = FactoryGirl.create(:group_cart, group_id: @group.id, cart_id: @cart1.id)
       
       puts "current carts"
       puts @group.lists
       puts "group.id"
       puts @group.id
       puts "cart.id"
       puts @cart1.id
       puts "group_cart"
       puts @group_cart.cart_id
       puts @group_cart.group_id

       assert @group.lists.length == 1, "can have a cart"

       @cart2 = FactoryGirl.create(:cart, id: 2)
       @group_cart = FactoryGirl.create(:group_cart, group_id: @group.id, cart_id: @cart2.id)
       assert @group.lists.length == 2, "can have multiple carts"
    end

    test "groups should be able to have associated carts" do
        assert false, "test not created yet"
    end
end
