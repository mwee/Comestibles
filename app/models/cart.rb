class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	validates :cart_name, 
			  	presence: true, 
			  	length: { minimum: 3 },
			  	uniqueness: { case_sensitive: true }
	# attr_accessible :finalized

	def total_price
		line_items.to_a.sum(&:full_price)
	end
end
