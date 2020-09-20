class UnreadsChannel < ApplicationCable::Channel
  def subscribed
    @team = Team.find_by(id: params['id'])
    stream_for @team
  end

  def unsubscribed
    stop_all_streams
  end
end
