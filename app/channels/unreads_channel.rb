class UnreadsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_for Team.find_by(id: params['id'])
  end

  def unsubscribed
    stop_all_streams
  end
end