class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update]

  def index
    teams = Team.includes(:users).all
    options = { includes: :memberships }
    render json: TeamSerializer.new(teams, options).serialized_json
  end

  def show
    messages = if params[:datetime]
                @team.messages.where('created_at > ?', params[:datetime])
               else
                @team.messages
               end
    render json: MessageSerializer.new(messages).serialized_json
  end

  def create
    team = Team.new(team_params)
    if team.save
      render json: TeamSerializer.new(team).serialized_json
    else
      render json: { error: 'could not be created' }
    end
  end

  def update
    if @team.update(team_params)
      render json: TeamSerializer.new(@team).serialized_json
    else
      render json: { error: 'could not be updated' }
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :description, :cover_url, user_ids: [])
  end
end
