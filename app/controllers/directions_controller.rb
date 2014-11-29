class DirectionsController < ApplicationController
  before_action :set_direction, only: [:update, :destroy]

  def create
    step = params[:step].to_i + 1
    @direction = Recipe.find(params[:recipe_id]).directions.build(step: step)
    @direction.save_and_reorder
    redirect_to edit_recipe_url(@direction.recipe_id)
  end

  def update
    @direction.update!(direction_params)
    redirect_to edit_recipe_url(@direction.recipe_id)
  end

  def destroy
    @direction.destroy!
    redirect_to edit_recipe_url(@direction.recipe_id)
  end

  private

  def direction_params
    params.require(:direction).permit(:image, :description)
  end

  def set_direction
    @direction = Recipe.find(params[:recipe_id]).directions.find(params[:id])
  end
end
