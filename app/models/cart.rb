class Cart < ActiveRecord::Base

	has_one :group
	has_one :group_cart
	has_many :line_items, dependent: :destroy

	validates :cart_name, 
			  	presence: true, 
			  	length: { minimum: 3 },
			  	uniqueness: { case_sensitive: true }
	
	attr_accessible :cart_name

	def total_price
		line_items.to_a.sum(&:full_price)
	end
end
