class DashboardController < ApplicationController
  def index
  end
  
  def main
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
