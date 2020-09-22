class MessagesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    team_ids = user.memberships.pluck(:team_id)
    messages = Message.where(team_id: team_ids)
    render json: MessageSerializer.new(messages).serialized_json
  end
end
