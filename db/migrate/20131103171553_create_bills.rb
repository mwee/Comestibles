class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.boolean :paid
      t.string :owner
      t.decimal :amount

      t.timestamps
    end
  end
end
