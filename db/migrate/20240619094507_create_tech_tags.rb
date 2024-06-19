class CreateTechTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tech_tags do |t|
      t.belongs_to :tech_category, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :display_order, default: 0, null: false

      t.timestamps
    end
  end
end
