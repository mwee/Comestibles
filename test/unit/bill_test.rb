require 'test_helper'

class BillTest < ActiveSupport::TestCase
	test "pay_to" do
	    @test_user = FactoryGirl.create(:user, id:0)
	    @group1 = FactoryGirl.create(:group, owner_id: 0, id: 0)	
		@cart = FactoryGirl.create(:cart, id: 0)
		@group_cart = FactoryGirl.create(:group_cart, cart_id: 0, group_id: 0)
		@bill = FactoryGirl.create(:bill)
		assert @bill.pay_to == 0

	end

	test "user has bills" do
	    @test_user = FactoryGirl.create(:user, id:0)
	    @group1 = FactoryGirl.create(:group, owner_id: 0, id: 0)	
		@cart = FactoryGirl.create(:cart, id: 0)
		@group_cart = FactoryGirl.create(:group_cart, cart_id: 0, group_id: 0)
		@bill = FactoryGirl.create(:bill, user_id: 0)
		assert @test_user.bills.length == 1
		assert @bill.user_id == 0
	end
end