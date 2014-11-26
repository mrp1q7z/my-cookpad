class TukureposController < ApplicationController
  def create
    @tukurepo = Recipe.find(params[:recipe_id]).tukurepos.build(tukurepo_params)
    @tukurepo.save!
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def tukurepo_params
    params.require(:tukurepo).permit(:image, :message)
  end
end
