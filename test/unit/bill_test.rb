require 'test_helper'

class BillTest < ActiveSupport::TestCase

	test "test who to pay_to" do
	    @test_user = FactoryGirl.create(:user, id:0)
	    @group1 = FactoryGirl.create(:group, owner_id: 0, id: 0)	
		@cart = FactoryGirl.create(:cart, id: 0)
		@group_cart = FactoryGirl.create(:group_cart, cart_id: 0, group_id: 0)
		@bill = FactoryGirl.create(:bill)
		assert @bill.pay_to == 0

	end

	test "user has_many bills association" do
	    @test_user = FactoryGirl.create(:user, id:0)
	    @group1 = FactoryGirl.create(:group, owner_id: 0, id: 0)	
		@cart = FactoryGirl.create(:cart, id: 0)
		@group_cart = FactoryGirl.create(:group_cart, cart_id: 0, group_id: 0)
		@bill = FactoryGirl.create(:bill, user_id: 0)
		assert @test_user.bills.length == 1
		assert @bill.user_id == 0
	end

	test "status_paid" do
		@test_user = FactoryGirl.create(:user, id:0)
		@bill = FactoryGirl.create(:bill, user_id: 0, status: "unpaid")
		@bill.status_paid
		assert @bill.status == "says_paid"
	end

	test "status_confirmed" do
		@test_user = FactoryGirl.create(:user, id:0)
		@bill = FactoryGirl.create(:bill, user_id: 0, status: "unpaid")
		@bill.status_confirmed
		assert @bill.status == "confirmed"
	end

	test "get_owner_name" do
		@test_user= FactoryGirl.create(:user, id:0, name: "bob")
		@test_user1 = FactoryGirl.create(:user, id:1, name: "joe")
	    @group1 = FactoryGirl.create(:group, owner_id: 0, id: 0)	
		@cart = FactoryGirl.create(:cart, id: 0)
		FactoryGirl.create(:group_membership, user_id:0, group_id:0)
		FactoryGirl.create(:group_membership, user_id:1, group_id:0)
		@group_cart = FactoryGirl.create(:group_cart, cart_id: 0, group_id: 0)
		@bill = FactoryGirl.create(:bill, user_id: 1, amount: 5.00)
		assert @bill.get_ower_name == "joe"
	end

	test "get_owed_name" do
		@test_user= FactoryGirl.create(:user, id:0, name: "bob")
		@test_user1 = FactoryGirl.create(:user, id:1, name: "joe")
	    @group1 = FactoryGirl.create(:group, owner_id: 0, id: 0)	
		@cart = FactoryGirl.create(:cart, id: 0)
		FactoryGirl.create(:group_membership, user_id:0, group_id:0)
		FactoryGirl.create(:group_membership, user_id:1, group_id:0)
		@group_cart = FactoryGirl.create(:group_cart, cart_id: 0, group_id: 0)
		@bill = FactoryGirl.create(:bill, user_id: 1, amount: 5.00)
		assert @bill.get_owed_name == "bob"
	end

end