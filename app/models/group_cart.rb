class GroupCart < ActiveRecord::Base
    attr_accessible :group_id, :cart_id

    belongs_to :group
    belongs_to :cart
end

