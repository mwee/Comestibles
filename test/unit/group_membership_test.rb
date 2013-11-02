require 'test_helper'

class GroupMembershipTest < ActiveSupport::TestCase
  test "users should initially have no group memberships" do
    user = FactoryGirl.create(:user)
    assert user.joined_groups.length == 0
  end

  test "users should be able to have joined groups" do
    
    #set up user
    test_user = FactoryGirl.create(:user)
    test_group = FactoryGirl.create(:group)
    
    #join a group
    group_membership = FactoryGirl.create(:group_membership, user_id: test_user.id, group_id: test_group.id)
    
    assert test_user.joined_groups.length == 1
  end

  test "users should be able to join a group" do
    #should have a method in users for joining a group
    assert false
  end


  test "groups should joined members" do
    #should be able call something like groups.members
    assert false
  end

end
