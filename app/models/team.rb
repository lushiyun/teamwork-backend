class Team < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  validates :name, :description, presence: true
end
