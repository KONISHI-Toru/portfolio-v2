class CreateProjectTechTagJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :projects, :tech_tags do |t|
      # t.index [:project_id, :tech_tag_id]
      # t.index [:tech_tag_id, :project_id]
    end
  end
end
