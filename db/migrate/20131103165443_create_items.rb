class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name
      t.decimal :unit_price
      t.integer :quantity
      t.integer :category_id
      t.integer :cart_id

      t.timestamps
    end
    add_index :items, [:cart_id]
  end
end
