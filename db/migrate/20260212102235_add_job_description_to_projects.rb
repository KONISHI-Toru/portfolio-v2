class AddJobDescriptionToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :job_description, :text, after: :sw_configuration
  end
end
