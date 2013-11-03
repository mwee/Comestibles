class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships, id: false do |t|
      t.column :user_id, :integer
      t.column :group_id, :integer
    end
  end
end
