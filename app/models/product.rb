class Product < ActiveRecord::Base
	belongs_to  :category
	before_save :default_values

	attr_accessible :name, :description, :price, :category_id

  def default_values
    self.category_id ||= 1
  end
end
