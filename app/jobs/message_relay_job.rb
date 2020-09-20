class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    team = message.team
    MessagesChannel.broadcast_to(team, MessageSerializer.new(message).serialized_json)
  end
end
