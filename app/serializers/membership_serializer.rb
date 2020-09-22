class MembershipSerializer
  include FastJsonapi::ObjectSerializer
  attributes :last_read_at
end
