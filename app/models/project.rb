class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :hw_diagram
  has_one_attached :sw_diagram
  has_and_belongs_to_many :tech_tags
  has_and_belongs_to_many :phases, join_table: :projects_phases
  has_and_belongs_to_many :positions, join_table: :projects_positions

  scope :published, -> { where(published: true) }
end
