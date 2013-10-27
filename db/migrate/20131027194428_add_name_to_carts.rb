class AddNameToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :cart_name, :string

  end
end
