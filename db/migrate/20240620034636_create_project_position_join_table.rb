class CreateProjectPositionJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :projects, :positions do |t|
      # t.index [:project_id, :position_id]
      # t.index [:position_id, :project_id]
    end
  end
end
