class UpdateBillTable < ActiveRecord::Migration
  def change
  	add_column :bills, :cart_id, :integer
  	add_column :bills, :status, :string
  	add_column :bills, :user_id, :integer
  	remove_column :bills, :owner, :string
  	remove_column :bills, :paid, :boolean
  end
end
