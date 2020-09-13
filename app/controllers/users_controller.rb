class UsersController < ApplicationController
  def index
    users = User.all
    render json: UserSerializer.new(users).serialized_json
  end

  def show
    user = User.find_by_id(params[:id])
    render json: UserSerializer.new([user]).serialized_json
  end

  def create
    if user = User.find_by(email: params[:email])
      user.update(user_params)
    else
      user = User.create(user_params)
    end
    render json: UserSerializer.new([user]).serialized_json
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :picture_url)
  end
end
