class KitchenController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @recipes = user.recipes.published
    @tukurepos = user.tukurepos
  end
end
