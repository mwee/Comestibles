require 'test_helper'

class GroupMembershipTest < ActiveSupport::TestCase
  test "users should initially have no group memberships" do
    @user = FactoryGirl.create(:user)
    assert @user.joined_groups.length == 0
  end

  test "users should be able to have a joined group" do
    #set up user and group
    @test_user = FactoryGirl.create(:user)
    @test_group = FactoryGirl.create(:group)
    
    #join a group
    FactoryGirl.create(:group_membership, user_id: @test_user.id, group_id: @test_group.id)
    
    assert @test_user.joined_groups.length == 1
  end


test "users should be able to have joined groups" do
    #set up user and group
    @test_user = FactoryGirl.create(:user)
    @group1 = FactoryGirl.create(:group, id: 1)
    @group2 = FactoryGirl.create(:group, id: 2)
    @group3 = FactoryGirl.create(:group, id: 3)
    
    #join a group
    FactoryGirl.create(:group_membership, user_id: @test_user.id, group_id: @group1.id)
    FactoryGirl.create(:group_membership, user_id: @test_user.id, group_id: @group2.id)

    assert @test_user.joined_groups.length == 2
  end

  test "groups should initially have no members" do
    @group = FactoryGirl.create(:group)
    assert @group.members.length == 0
  end


  test "groups should be able to have a joined member" do
    #set up user and group
    @test_user = FactoryGirl.create(:user)
    @test_group = FactoryGirl.create(:group)
    
    #join a group
    FactoryGirl.create(:group_membership, user_id: @test_user.id, group_id: @test_group.id)
    
    assert @test_group.members.length == 1
  end

  test "groups should be able to have joined members" do
    #set up user and group
    @user1 = FactoryGirl.create(:user, id: 1)
    @user2 = FactoryGirl.create(:user, id: 2)
    @user3 = FactoryGirl.create(:user, id: 3)
    @test_group = FactoryGirl.create(:group)
    
    #join a group
    FactoryGirl.create(:group_membership, user_id: @user1.id, group_id: @test_group.id)
    FactoryGirl.create(:group_membership, user_id: @user3.id, group_id: @test_group.id)

    assert @test_group.members.length == 2
  end

  #Should move to an integration test... maybe under models?
  test "users should be able to join a group" do
    #should have a method in users for joining a group
    assert false, "not implemented yet"
  end


end
