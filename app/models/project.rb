class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :hw_diagram
  has_one_attached :sw_diagram
  has_many :project_tech_tags, dependent: :delete_all
  has_many :tech_tags, through: :project_tech_tags
end
