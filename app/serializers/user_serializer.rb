class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :name, :picture_url
  has_many :memberships
  has_many :teams, through: :memberships
end
