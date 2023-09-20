class AddDetailsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user_id, :bigint
    add_index :comments, :user_id
    add_column :comments, :post_id, :bigint
    add_index :comments, :post_id
    add_column :comments, :text, :text
  end
end
