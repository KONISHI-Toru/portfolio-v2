class AddUniqIndex < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :projects_phases, :projects
    add_foreign_key :projects_phases, :phases
    add_index :projects_phases, %i[project_id phase_id], unique: true

    add_foreign_key :projects_positions, :projects
    add_foreign_key :projects_positions, :positions
    add_index :projects_positions, %i[project_id position_id], unique: true

    add_foreign_key :projects_tech_tags, :projects
    add_foreign_key :projects_tech_tags, :tech_tags
    add_index :projects_tech_tags, %i[project_id tech_tag_id], unique: true
  end
end
