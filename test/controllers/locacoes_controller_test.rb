require 'test_helper'

class LocacoesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get materiais" do
    get :materiais
    assert_response :success
  end

end
