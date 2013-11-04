class Group < ActiveRecord::Base
    attr_accessible :owner_id, :name, :id

    #set up the user which owns the group
    has_one :user

    #allow multiple members to join the group
    has_many :group_memberships
    has_many :members, through: :group_memberships, source: "user"

    #each group can have many carts
    has_many :group_carts
    has_many :lists, through: :group_carts, source: "cart"

<<<<<<< HEAD
    def get_owner_name
    	return User.find(self.owner_id).name
    end
=======
	def get_owner_name
		return User.find(self.owner_id).name
	end
>>>>>>> 263d1e7e3b2af26d3595abeb33e233a679c02f98

end
