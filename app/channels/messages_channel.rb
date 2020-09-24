class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_for Team.find_by(id: params['id'])
  end

  def receive(data)
    team = Team.find_by(id: data['teamId'])
    user = User.find_by(id: data['userId'])
    message = team.messages.create(content: data['content'], user: user)
    MessageRelayJob.perform_later(message)
  end

  def unsubscribed
    stop_all_streams
  end
end
