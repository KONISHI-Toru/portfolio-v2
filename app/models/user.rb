class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :recoverable, :validatable

  enum role: {
    administrator: 1,
    owner: 2,
  }

  has_one :profile

  scope :published, -> { joins(:profile).merge(Profile.published) }

  def self.find_for_database_authentication(warden_conditions)
    find_by(email: warden_conditions[:email], available: true)
  end

  def admin?
    self.administrator?
  end
end
