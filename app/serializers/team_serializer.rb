class TeamSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :cover_url, :created_at
  has_many :memberships
  has_many :users, through: :memberships
end
