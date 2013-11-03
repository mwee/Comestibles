class CreateGroupCarts < ActiveRecord::Migration
  def change
    create_table :group_carts, id: false do |t|
      t.integer :group_id
      t.integer :cart_id
    end
  end
end
