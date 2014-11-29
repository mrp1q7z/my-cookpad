class HomeController < ApplicationController
  def index
    @recipes = Recipe.published.all
  end
end
