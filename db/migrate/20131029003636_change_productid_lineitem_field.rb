class ChangeProductidLineitemField < ActiveRecord::Migration
  def change
  	change_column :line_items, :product_id, :integer
  end
end
