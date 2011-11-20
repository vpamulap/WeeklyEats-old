class DashboardController < ApplicationController
  def index
    session[:rids] = nil
  end
  
  def main
    # Get correct number of recipes
    if (session[:rids] == nil) || (session[:rids].length == 0)
      nmeals = params[:mealnumber].to_i
      @recipes = Recipe.all.sample(nmeals)
    
    # Get recipe id's and set initial confirmations to false
      recipe_ids = []
      recipe_conf = []
      @recipes.each do |recipe|
        recipe_ids << recipe.id
        recipe_conf << false
      end
      
      session[:rids] = recipe_ids
      session[:rc] = recipe_conf
    else
      @recipes = Recipe.all
      @recipes.delete_if do |recipe|
        not session[:rids].include?(recipe.id)
      end
    end
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
    # Build shopping list from session vars
    rids = session[:rids]
    rc = session[:rc]
    
    # Build an array of recipes from rids
    recipes = []
    rids.each { |rid| recipes << Recipe.find(rid) }
    
    # Consolidate recipes and build a grocery list
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
        rids = []
        
        recipes.each do |recipe|
            recipe.ingredients.each do |ingredient|
                if ingredient.name == name
                    quantity += ingredient.quantity
                    rids << ingredient.recipe_id
                end
            end
        end
        
        groceries << { :quantity => quantity, :name => name, :recipes => rids.join(',') }
    end
    
    # Remove items with 0 quantity
    groceries.delete_if { |g| g[:quantity] == 0 } 
    
    groceries
  end
  
  def buy
  end
end



