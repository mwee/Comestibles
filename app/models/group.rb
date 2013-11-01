class Group < ActiveRecord::Base

    has_one :user
    has_many :group_memberships, through: :group_memberships, source: "user"

end
