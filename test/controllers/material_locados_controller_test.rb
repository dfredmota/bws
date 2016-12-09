require 'test_helper'

class MaterialLocadosControllerTest < ActionController::TestCase
  setup do
    @material_locado = material_locados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:material_locados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create material_locado" do
    assert_difference('MaterialLocado.count') do
      post :create, material_locado: { descricao: @material_locado.descricao, quantidade: @material_locado.quantidade }
    end

    assert_redirected_to material_locado_path(assigns(:material_locado))
  end

  test "should show material_locado" do
    get :show, id: @material_locado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @material_locado
    assert_response :success
  end

  test "should update material_locado" do
    patch :update, id: @material_locado, material_locado: { descricao: @material_locado.descricao, quantidade: @material_locado.quantidade }
    assert_redirected_to material_locado_path(assigns(:material_locado))
  end

  test "should destroy material_locado" do
    assert_difference('MaterialLocado.count', -1) do
      delete :destroy, id: @material_locado
    end

    assert_redirected_to material_locados_path
  end
end
