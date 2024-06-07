class AddIsAvailableToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :available, :boolean, null: false, default: false, after: :remember_created_at
  end
end
