class TechCategory < ApplicationRecord
  belongs_to :parent, class_name: 'TechCategory', inverse_of: :children, optional: true

  has_many :children, class_name: 'TechCategory', foreign_key: :parent_id, inverse_of: :parent
end
