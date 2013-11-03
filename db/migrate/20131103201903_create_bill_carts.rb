class CreateBillCarts < ActiveRecord::Migration
  def change
    create_table :bill_carts do |t|

      t.timestamps
    end
  end
end
