class User < ApplicationRecord
  has_many :memberships
  has_many :teams, through: :memberships
  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
