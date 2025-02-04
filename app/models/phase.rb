class Phase < ApplicationRecord
  has_and_belongs_to_many :projects, join_table: :projects_phases

  validates :name, presence: true, length: { maximum: 255 }
  validates :display_order, presence: true, numericality: { only_integer: true }
end
