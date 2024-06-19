class TechTag < ApplicationRecord
  belongs_to :tech_category
  has_many :project_tech_tags, dependent: :restrict_with_error
  has_many :projects, through: :project_tech_tags

  validates :name, presence: true, length: { maximum: 255 }
  validates :display_order, presence: true, numericality: { only_integer: true }
end
