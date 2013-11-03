class Item < ActiveRecord::Base
	belongs_to :cart
	validates :cart_id, presence: true

	attr_accessible :cart_id, :name, :quantity, :unit_price


	def full_price
		unit_price * quantity
	end
	
end
