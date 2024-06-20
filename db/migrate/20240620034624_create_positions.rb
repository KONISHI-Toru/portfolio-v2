class CreatePositions < ActiveRecord::Migration[7.1]
  def change
    create_table :positions do |t|
      t.string :name, null: false
      t.integer :display_order, default: 0, null: false

      t.timestamps
    end
  end
end
