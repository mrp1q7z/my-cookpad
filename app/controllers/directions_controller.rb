class DirectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe
  before_action :set_direction, only: [:update, :destroy, :delete_image, :move_highter, :move_lower]

  def create
    direction = @recipe.directions.build(direction_params)
    direction.save_and_reorder
    render :directions
  end

  def update
    @direction.update!(direction_params)
    respond_to do |format|
      format.html { redirect_to edit_recipe_path(@direction.recipe_id) }
      format.js { render :directions }
    end
  end

  def destroy
    @direction.destroy!
    render :directions
  end

  def delete_image
    @direction.image = nil
    @direction.save
    render :directions
  end

  def move_highter
    @direction.move(:higher)
    render :directions
  end

  def move_lower
    @direction.move(:lower)
    render :directions
  end

  private

  def direction_params
    params.require(:direction).permit(:image, :description, :step)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_direction
    @direction = @recipe.directions.find(params[:id])
  end
end
