class AddAdminFieldToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :admin, :boolean
    add_index :users, :admin
  end
  def down
    remove_column :users, :admin, :boolean
    remove_index :users, :admin
  end
end
