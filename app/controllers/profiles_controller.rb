class ProfilesController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @categories = current_user.categories
  end
end
