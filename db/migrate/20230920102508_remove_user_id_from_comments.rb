class RemoveUserIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_index :comments, :user_id
    remove_column :comments, :user_id, :bigint
  end
end
