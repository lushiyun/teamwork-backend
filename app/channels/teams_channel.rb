class TeamsChannel < ApplicationCable::Channel
  def subscribed
    @team = Team.find_by(id: params[:id])
    stream_for @team
  end

  def receive(data)
    TeamsChannel.broadcast_to(@team, { team: @team, users: @team.users, messages: @team.messages })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
