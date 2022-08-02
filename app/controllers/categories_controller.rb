class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show destroy]

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.author_id = current_user.id

    if @category.save
      redirect_to categories_url, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
