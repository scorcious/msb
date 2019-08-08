class ProfilesController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @categories = current_user.categories
  end


  def index
    @profiles = policy_scope(Profile).order(created_at: :desc)
  end

end
