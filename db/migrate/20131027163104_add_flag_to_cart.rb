class AddFlagToCart < ActiveRecord::Migration
  def up
    add_column :carts, :finalized, :boolean, default: false
  end

  def down
    remove_column :carts, :finalized
  end
end
