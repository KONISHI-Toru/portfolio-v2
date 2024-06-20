class Position < ApplicationRecord
  has_many :project_positions, dependent: :restrict_with_error
  has_many :projects, through: :project_positions
    
  validates :name, presence: true, length: { maximum: 255 }
  validates :display_order, presence: true, numericality: { only_integer: true }
end
