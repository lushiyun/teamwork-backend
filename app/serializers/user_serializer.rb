class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :picture_url
  has_many :memberships
  has_many :teams, through: :memberships
end
