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

end
