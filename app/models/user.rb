class User < ApplicationRecord
  belongs_to :team, optional: true
  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
