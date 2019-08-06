class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    authorize @category
    if @category.save!
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def edit
    authorize @category
  end

  def update
    authorize @category
    @category.update(category_params)
    redirect_to profile_path(current_user)
  end

  def destroy
    authorize @category
    @category.destroy
    redirect_to profile_path(current_user)
  end


  private

  def category_params
    params.require(:category).permit(:name, :level)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
