class UsersController < ApplicationController
  def index
    users = User.all
    render json: UserSerializer.new(users).serialized_json
  end

  def show
    user = User.find_by_id(params[:id])
    render json: UserSerializer.new(user).serialized_json
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
