class MessagesController < ApplicationController
  before_action :set_team
  before_action :set_user

  def create
    message = @team.messages.new(message_params)
    message.user = @user
    if message.save
      
    end
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
