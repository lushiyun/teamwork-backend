class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :name, :picture_url
  has_many :memberships
  has_many :teams, through: :memberships
end
