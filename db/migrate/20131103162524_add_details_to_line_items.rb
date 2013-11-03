class AddDetailsToLineItems < ActiveRecord::Migration
  def change
  	add_column :line_items, :category_id, :integer
  	add_column :line_items, :name, :string

  end
end
