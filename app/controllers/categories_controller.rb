class CategoriesController < ApplicationController

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
    @category = Category.find(params[:id])
    authorize @category
  end

  def update
    @category = Category.find(params[:id])
    authorize @category
    @category.update(category_params)
    redirect_to profile_path(current_user)
  end


  private

  def category_params
    params.require(:category).permit(:name, :level)
  end
end
