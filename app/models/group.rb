class Group < ActiveRecord::Base

    has_one :user
    has_many :group_memberships
    has_many :members, through: :group_memberships, source: "user"

end
