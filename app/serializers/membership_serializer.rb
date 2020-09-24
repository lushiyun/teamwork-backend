class MembershipSerializer
  include FastJsonapi::ObjectSerializer
  attributes :last_read_at
  belongs_to :user
  belongs_to :team
end
