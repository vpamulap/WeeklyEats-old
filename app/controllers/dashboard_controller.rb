class DashboardController < ApplicationController
  def index
  end
  
  def main
    @nmeals = @params[:meal_number]  
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
