require 'test_helper'

class GroupMembershipTest < ActiveSupport::TestCase
  test "users should initially have no group memberships" do
    user = FactoryGirl.create(:user)
    assert user.joined_groups.length == 0
  end

  test "users should be to have joined groups" do
    test_user = FactoryGirl.create(:user)
    test_group = FactoryGirl.create(:group)
    group_membership = FactoryGirl.create(:group_membership, user_id: test_user.id, group_id: test_group.id)
    puts "joined groups do"
    puts test_user.joined_groups
    puts "end"
    assert test_user.joined_groups.length == 1
  end


  test "A groups owner should be its creator" do
    assert true
  end

  test "users should be able to be members of groups" do 
    assert true
  end

  test "groups should have members" do
    assert true
  end

end
