class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :introduction
      t.boolean :published, null: false, default: false

      t.timestamps
    end
  end
end
