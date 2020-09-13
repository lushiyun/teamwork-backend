class TeamsController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def index
    teams = Team.all
    # options = { include: :users }
    render json: TeamSerializer.new(teams).serialized_json
  end

  def show
    options = { include: :users }
    render json: TeamSerializer.new(@team, options).serialized_json
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
      render json: TeamSerializer.new(team).serialized_json
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
