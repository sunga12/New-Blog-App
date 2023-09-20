class RemovePostIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_index :comments, :post_id
    remove_column :comments, :post_id, :bigint
  end
end
