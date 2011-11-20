class DashboardController < ApplicationController
  def index
  end
  
  def main
    # Get correct number of recipes
    nmeals = params[:mealnumber].to_i
    @recipes = Recipe.all.sample(nmeals)
    
    # Get recipe id's
    recipe_ids = []
    @recipes.each do |recipe|
        recipe_ids << recipe.id
    end
    
    
  end

  def stats
  end

  def recipe
  end
  
  def setup
  end
  
  def shopping
  end
end
