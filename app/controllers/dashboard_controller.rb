class DashboardController < ApplicationController
  def index
  end
  
  def meals
    @recipes = Recipe.all
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
