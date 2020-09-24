class UsersController < ApplicationController
  def index
    users = User.includes(:teams).all
    render json: UserSerializer.new(users).serialized_json
  end

  def update
    user = User.find(params[:id])
    membership = user.memberships.find_by(team_id: params[:team_id])
    membership.update(last_read_at: params[:last_read_at])
    render json: MembershipSerializer.new(membership, include: [:team]).serialized_json
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user).serialized_json
    else
      render json: { error: 'error creating user' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :picture_url)
  end
end
