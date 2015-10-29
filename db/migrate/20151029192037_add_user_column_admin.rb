class AddUserColumnAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :user, :boolean
  end
end
