class TukureposController < ApplicationController
  def show
    @tukurepo = Tukurepo.find(params[:id])
  end

  def create
    @tukurepo = Recipe.find(params[:recipe_id]).tukurepos.build(tukurepo_params)
    #@tukurepo.save!
    #redirect_to recipe_path(params[:recipe_id])

    respond_to do |format|
      if @tukurepo.save
        format.js { render action: :show }
      else
        format.js { render json: @tukurepo.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def tukurepo_params
    params.require(:tukurepo).permit(:image, :message)
  end
end
