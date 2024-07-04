class AddRoleToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :integer, default: 2, null: false, after: :email
  end
end
