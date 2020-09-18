class Team < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :messages
  validates :name, :description, presence: true
end
