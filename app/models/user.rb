class User < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :teams, through: :memberships
  validates :user_id, :name, presence: true
  validates :user_id, uniqueness: true
end
