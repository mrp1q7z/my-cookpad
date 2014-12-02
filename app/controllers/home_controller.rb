class HomeController < ApplicationController
  def index
    @recipes = Recipe.published.page(params[:page])
  end
end
