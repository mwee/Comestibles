class DropUnusedTables < ActiveRecord::Migration
  def change
    drop_table :products
    drop_table :line_items
    drop_table :categories
    drop_table :bill_carts
  end
end
