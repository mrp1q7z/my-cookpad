class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :delete_image, :publish]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to edit_recipe_path(@recipe) }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @recipe.build_child_items
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to edit_recipe_path(@recipe) }
      else
        format.html { render :edit }
      end
    end
  end

  def delete_image
    @recipe.image = nil
    @recipe.save
    redirect_to edit_recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.published.find(params[:id])
  end

  def publish
    if @recipe.update(status: :published)
      redirect_to @recipe, notice: '公開しました'
    else
      render :edit
    end
  end

  private

  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:image, :title, :catch_copy,
      ingredients_attributes: [:id, :title, :quantity, :_destroy],
      directions_attributes: [:id, :order, :image, :description, :_destroy])
  end
end
