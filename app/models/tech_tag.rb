class TechTag < ApplicationRecord
  belongs_to :tech_category
  has_and_belongs_to_many :projects

  validates :name, presence: true, length: { maximum: 255 }
  validates :display_order, presence: true, numericality: { only_integer: true }
end
