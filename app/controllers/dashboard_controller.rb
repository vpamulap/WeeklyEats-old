class DashboardController < ApplicationController
  def index
  end
  
  def main
    # Get correct number of recipes
    nmeals = params[:mealnumber].to_i
    @recipes = Recipe.all.sample(nmeals)
    
    # Get recipe id's and set initial confirmations to false
    recipe_ids = []
    recipe_conf = []
    @recipes.each do |recipe|
        recipe_ids << recipe.id
        recipe_conf << false
    end
    session[:rid] = recipe_ids
    session[:rc] = recipe_conf
  end

  def stats
  end

  def recipe
    recipe_id = params[:recipe_id].to_i
    @recipe = Recipe.all[recipe_id]
  end
  
  def setup
  end
  
  def shopping
  end
end



