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
    # Build shopping list from session vars
    rids = session[:rids]
    rc = session[:rc]
    
    # Build an array of recipes from rids
    recipes = []
    rids.each { |rid| recipes << Recipe.find(rid) }
    
    @groceries = consolidate(recipes)
    
    
  end
  
   def consolidate(recipes)
    # Find all unique names
    names = []
    recipes.each do |recipe|
        recipe.ingredients.each do |ingredient|
             names << ingredient.name
        end
    end
    
    names.uniq!
    
    # Find quantity and recipe_id's for each name
    groceries = []
    names.each do |name|
        quantity = 0
        recipes = []
        
        recipes.each do |recipe|
            recipe.ingredients.each do |ingredient|
                if ingredient.name == name
                    quantity += ingredient.quantity
                    recipes << ingredient.recipe_id
                end
            end
        end
        
        groceries << { 'quantity' => quantity, 'name' => name, 'recipes' => recipes.join(',') }
    end
    
    logger.info groceries
    
    groceries
  end
end
