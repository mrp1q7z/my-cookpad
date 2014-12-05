class DirectionsController < ApplicationController
  before_action :set_direction, only: [:update, :destroy, :delete_image, :move_highter, :move_lower]

  def create
    step = params[:step].to_i + 1
    direction = Recipe.find(params[:recipe_id]).directions.build(step: step)
    direction.save_and_reorder
    @directions = Recipe.find(params[:recipe_id]).directions
    render :directions
  end

  def update
    @direction.update!(direction_params)
    @directions = Recipe.find(params[:recipe_id]).directions
    respond_to do |format|
      format.html { redirect_to edit_recipe_path(@direction.recipe_id) }
      format.js { render :directions }
    end
  end

  def destroy
    @direction.destroy!
    @directions = Recipe.find(params[:recipe_id]).directions
    render :directions
  end

  def delete_image
    @direction.image = nil
    @direction.save
    @directions = Recipe.find(params[:recipe_id]).directions
    render :directions
  end

  def move_highter
    @direction.move(:higher)
    @directions = Recipe.find(params[:recipe_id]).directions
    render :directions
  end

  def move_lower
    @direction.move(:lower)
    @directions = Recipe.find(params[:recipe_id]).directions
    render :directions
  end

  private

  def direction_params
    params.require(:direction).permit(:image, :description)
  end

  def set_direction
    @direction = Recipe.find(params[:recipe_id]).directions.find(params[:id])
  end
end
