class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :hw_diagram
  has_one_attached :sw_diagram
end
