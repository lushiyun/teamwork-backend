class User < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :teams, through: :memberships
  validates :email, :name, presence: true
  validates :email, uniqueness: true
end
