require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get stats" do
    get :stats
    assert_response :success
  end

  test "should get recipe" do
    get :recipe
    assert_response :success
  end

end
