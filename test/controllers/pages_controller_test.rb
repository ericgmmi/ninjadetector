require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get scan" do
    get :scan
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get rogue" do
    get :rogue
    assert_response :success
  end

  test "should get configure" do
    get :configure
    assert_response :success
  end

end
