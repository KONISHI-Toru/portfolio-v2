class TechCategory < ApplicationRecord
  belongs_to :parent, class_name: 'TechCategory', inverse_of: :children, optional: true

  has_many :children, -> { order(:display_order) }, class_name: 'TechCategory', foreign_key: :parent_id, inverse_of: :parent
  has_many :tech_tags, -> { order(:display_order) }, inverse_of: :tech_category
end
