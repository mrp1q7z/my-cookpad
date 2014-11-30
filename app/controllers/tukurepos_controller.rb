class TukureposController < ApplicationController
  def create
    @tukurepo = current_user.tukurepos.build(tukurepo_params)
    @tukurepo.recipe_id = params[:recipe_id]
    @tukurepo.save!
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def tukurepo_params
    params.require(:tukurepo).permit(:image, :message)
  end
end
