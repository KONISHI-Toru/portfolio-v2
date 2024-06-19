class CreateTechCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :tech_categories do |t|
      t.belongs_to :parent
      t.string :name, null: false
      t.integer :display_order, default: 0, null: false

      t.timestamps
    end

    add_foreign_key :tech_categories, :tech_categories, column: 'parent_id'
  end
end
