class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :target
      t.text :overview
      t.text :hw_configuration
      t.text :sw_configuration
      t.string :production_url
      t.string :repository_url
      t.date :from
      t.date :to
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :published, default: false, null: false

      t.timestamps
    end
  end
end
