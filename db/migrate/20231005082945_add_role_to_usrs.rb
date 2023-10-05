class AddRoleToUsrs < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string, null: false, default: 'user'
    User.update_all(role: 'user')
  end
end
