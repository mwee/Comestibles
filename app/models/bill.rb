class Bill < ActiveRecord::Base
	belongs_to :user
	belongs_to :cart

	def pay_to
		return self.cart.group.owner_id
	end

	def status_paid
		self.status = "says_paid"
	end

	def status_confirmed
		self.status = "confirmed"
	end

end
