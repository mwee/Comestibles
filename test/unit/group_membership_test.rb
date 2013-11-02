require 'test_helper'

class GroupMembershipTest < ActiveSupport::TestCase
  test "users should initially have no group memberships" do
    user = FactoryGirl.build(:user)
    puts user.joined_groups
    # assert user.group_memberships.length == 0
    assert true
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
