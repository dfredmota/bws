require 'test_helper'

class GrupoInsumosControllerTest < ActionController::TestCase
  setup do
    @grupo_insumo = grupo_insumos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grupo_insumos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grupo_insumo" do
    assert_difference('GrupoInsumo.count') do
      post :create, grupo_insumo: { descricao: @grupo_insumo.descricao }
    end

    assert_redirected_to grupo_insumo_path(assigns(:grupo_insumo))
  end

  test "should show grupo_insumo" do
    get :show, id: @grupo_insumo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grupo_insumo
    assert_response :success
  end

  test "should update grupo_insumo" do
    patch :update, id: @grupo_insumo, grupo_insumo: { descricao: @grupo_insumo.descricao }
    assert_redirected_to grupo_insumo_path(assigns(:grupo_insumo))
  end

  test "should destroy grupo_insumo" do
    assert_difference('GrupoInsumo.count', -1) do
      delete :destroy, id: @grupo_insumo
    end

    assert_redirected_to grupo_insumos_path
  end
end
