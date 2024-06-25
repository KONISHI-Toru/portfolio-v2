class CreateProjectPhaseJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :projects, :phases, table_name: :projects_phases do |t|
      # t.index [:project_id, :phase_id]
      # t.index [:phase_id, :project_id]
    end
  end
end
