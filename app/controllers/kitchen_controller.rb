class KitchenController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    if user == current_user
      @recipes = user.recipes
    else
      @recipes = user.recipes.published
    end
    @tukurepos = user.tukurepos
  end
end
