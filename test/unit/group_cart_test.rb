require 'test_helper'

class GroupCartTest < ActiveSupport::TestCase
    test "groups should initially have no carts; can have some" do
       @group = FactoryGirl.create(:group)
       @cart1 = FactoryGirl.create(:cart)
       assert @group.lists.length == 0, "initially have no carts"

       @group_cart = FactoryGirl.create(:group_cart, group_id: @group.id, cart_id: @cart1.id)
       
       @group.lists.reload
       assert @group.lists.length == 1, "can have a cart"

       @cart2 = FactoryGirl.create(:cart, id: 2, cart_name: "cart 2")
       @group_cart = FactoryGirl.create(:group_cart, group_id: @group.id, cart_id: @cart2.id)
       
       @group.lists.reload
       assert @group.lists.length == 2, "can have multiple carts"
    end

    test "carts should belong to a group" do
        @group = FactoryGirl.create(:group, name: "unique name")
        @cart = FactoryGirl.create(:cart)

        puts "@cart.group debug info"
        puts @cart.group.class

        assert @cart.group.nil?, "initially have no groups"

        @group_cart = FactoryGirl.create(:group_cart, group_id: @group.id, cart_id: @cart.id)
        
        @cart.group.reload
        assert @cart.group.name == "unique name", "should map to the correct group" 

        assert false, "test not created yet"
    end
end
