class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content
  belongs_to :team
  belongs_to :user
end
