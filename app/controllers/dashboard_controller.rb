class DashboardController < ApplicationController
  def index
  end
  
  def main
    nmeals = params[:mealnumber].to_i
    @recipes = Recipe.all.sample(nmeals)
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
