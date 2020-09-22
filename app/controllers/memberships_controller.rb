class MembershipsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    memberships = user.memberships
    render json: MembershipSerializer.new(memberships).serialized_json
  end
end
