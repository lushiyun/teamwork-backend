class MembershipsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    memberships = user.memberships
    render json: MembershipSerializer.new(memberships, include: [:team]).serialized_json
  end

  def show
    membership = Membership.find(params[:id])
    render json: MembershipSerializer.new(membership, include: [:team]).serialized_json
  end
end
