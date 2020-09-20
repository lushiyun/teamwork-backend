class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :created_at
  belongs_to :team
  belongs_to :user
end
