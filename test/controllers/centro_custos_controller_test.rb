require 'test_helper'

class CentroCustosControllerTest < ActionController::TestCase
  setup do
    @centro_custo = centro_custos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:centro_custos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create centro_custo" do
    assert_difference('CentroCusto.count') do
      post :create, centro_custo: { descricao: @centro_custo.descricao }
    end

    assert_redirected_to centro_custo_path(assigns(:centro_custo))
  end

  test "should show centro_custo" do
    get :show, id: @centro_custo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @centro_custo
    assert_response :success
  end

  test "should update centro_custo" do
    patch :update, id: @centro_custo, centro_custo: { descricao: @centro_custo.descricao }
    assert_redirected_to centro_custo_path(assigns(:centro_custo))
  end

  test "should destroy centro_custo" do
    assert_difference('CentroCusto.count', -1) do
      delete :destroy, id: @centro_custo
    end

    assert_redirected_to centro_custos_path
  end
end
