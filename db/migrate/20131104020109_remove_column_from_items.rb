class RemoveColumnFromItems < ActiveRecord::Migration
  def change
  	remove_column :items, :category_id
  end
end
