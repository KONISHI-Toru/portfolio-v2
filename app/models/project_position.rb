class ProjectPosition < ApplicationRecord
  belongs_to :project
  belongs_to :position
end
