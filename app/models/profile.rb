class Profile < ApplicationRecord
  belongs_to :user

  scope :published, -> { where(published: true) }
end
