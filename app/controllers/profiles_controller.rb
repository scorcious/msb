class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_profile, only: [:add_friend, :accept_friend]

  def index
    @profiles = policy_scope(Profile).order(created_at: :desc)
  end

  def show
    @profile = User.find(params[:id])
    authorize @profile
    @categories = User.find(params[:id]).categories
  end

  def add_friend
    current_user.friend_request(@profile)
  end

  def accept_friend
    current_user.accept_request(@profile)
    raise
  end

  private

  def set_profile
    authorize @profile = Profile.find(params[:id])
  end

end
