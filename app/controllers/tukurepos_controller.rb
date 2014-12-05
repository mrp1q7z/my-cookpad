class TukureposController < ApplicationController
  def create
    # TODO: permitでrecipe_idを追加するとrecipe_idを代入しなくていよい？
    @tukurepo = current_user.tukurepos.build(tukurepo_params)
    @tukurepo.recipe_id = params[:recipe_id]
    if @tukurepo.save
      redirect_to recipe_path(params[:recipe_id])
    else
      redirect_to recipe_path(params[:recipe_id]),
        alert: @tukurepo.errors.full_messages.join(", ");
    end
  end

  private

  def tukurepo_params
    params.require(:tukurepo).permit(:image, :message)
  end
end
