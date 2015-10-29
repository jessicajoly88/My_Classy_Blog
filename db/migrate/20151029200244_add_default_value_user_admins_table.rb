class AddDefaultValueUserAdminsTable < ActiveRecord::Migration
  def change
    change_column_default :admins, :user, true
  end
end
