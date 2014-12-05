class TukureposController < ApplicationController
  def create
    @tukurepo = current_user.tukurepos.build(tukurepo_params)
    if @tukurepo.save
      redirect_to recipe_path(params[:recipe_id])
    else
      redirect_to recipe_path(params[:recipe_id]),
        alert: @tukurepo.errors.full_messages.join(", ");
    end
  end

  private

  def tukurepo_params
    params.require(:tukurepo).permit(:image, :message, :recipe_id)
  end
end
