class Bill < ActiveRecord::Base
	attr_accessible :user_id, :cart_id, :status, :amount

	belongs_to :user
	belongs_to :cart

	def pay_to
		return self.cart.group.owner_id
	end

	def status_paid
		self.status = "says_paid"
		self.save
	end

	def status_confirmed
		self.status = "confirmed"
		self.save
	end

	def get_ower_name
		return User.find(self.user_id).name
	end

	def get_owed_name
		return User.find(self.pay_to).name
	end

end
