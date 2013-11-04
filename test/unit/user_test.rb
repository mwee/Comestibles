require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "grabbing owed_bills for a user" do
		@test_user= FactoryGirl.create(:user, id:0)
		@test_user1 = FactoryGirl.create(:user, id:1)
	    @group1 = FactoryGirl.create(:group, owner_id: 0, id: 0)	
		@cart = FactoryGirl.create(:cart, id: 0)
		FactoryGirl.create(:group_membership, user_id:0, group_id:0)
		FactoryGirl.create(:group_membership, user_id:1, group_id:0)
		@group_cart = FactoryGirl.create(:group_cart, cart_id: 0, group_id: 0)
		@bill = FactoryGirl.create(:bill, user_id: 1, amount: 5.00)
		assert @test_user.owed_bills.length == 1
	end

	test "count_users" do 
		@test_user = FactoryGirl.create(:user, id:0)
		@test_user2 = FactoryGirl.create(:user, id:1)
		assert User.count_users == 2
	end

	test "get_bills" do
		@test_user = FactoryGirl.create(:user, id:0)
		@test_user1 = FactoryGirl.create(:user, id:1)
		@test_user2 = FactoryGirl.create(:user, id:2)
	    @group1 = FactoryGirl.create(:group, owner_id: 0, id: 0)
		@cart = FactoryGirl.create(:cart, id: 0)
		FactoryGirl.create(:group_membership, user_id:0, group_id:0)
		FactoryGirl.create(:group_membership, user_id:1, group_id:0)
		FactoryGirl.create(:group_membership, user_id:2, group_id:0)
		@group_cart = FactoryGirl.create(:group_cart, cart_id: 0, group_id: 0)
		@bill1 = FactoryGirl.create(:bill, user_id: 1, amount: 5.00)
		@bill2 = FactoryGirl.create(:bill, user_id: 2, amount: 5.00)
		assert @test_user1.get_bills.length == 1
	end
end











