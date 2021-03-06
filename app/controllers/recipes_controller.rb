class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]
  before_action :set_recipe, only: [:edit, :update, :delete_image, :publish]

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
        format.js
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
    if @recipe.publish
      redirect_to @recipe, notice: '公開しました'
    else
      render :edit
    end
  end

  def search
    @keywords = params[:search].squish.presence || 'すべて'
    @recipes = Recipe.keywords_search(params[:search]).published.page(params[:page]).per(3)
  end

  private

  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:image, :title, :catch_copy,
      ingredients_attributes: [:id, :title, :quantity, :_destroy],
      directions_attributes: [:id, :step, :image, :description, :_destroy])
  end
end
