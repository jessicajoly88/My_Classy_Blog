class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :post_id, :integer
      t.column :user_id, :integer
      t.column :content, :text
      t.timestamps
    end
  end
end
