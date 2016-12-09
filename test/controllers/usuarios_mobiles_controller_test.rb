require 'test_helper'

class UsuariosMobilesControllerTest < ActionController::TestCase
  setup do
    @usuarios_mobile = usuarios_mobiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuarios_mobiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuarios_mobile" do
    assert_difference('UsuariosMobile.count') do
      post :create, usuarios_mobile: { colaborador_id: @usuarios_mobile.colaborador_id, login: @usuarios_mobile.login, senha: @usuarios_mobile.senha, super_usuario: @usuarios_mobile.super_usuario }
    end

    assert_redirected_to usuarios_mobile_path(assigns(:usuarios_mobile))
  end

  test "should show usuarios_mobile" do
    get :show, id: @usuarios_mobile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuarios_mobile
    assert_response :success
  end

  test "should update usuarios_mobile" do
    patch :update, id: @usuarios_mobile, usuarios_mobile: { colaborador_id: @usuarios_mobile.colaborador_id, login: @usuarios_mobile.login, senha: @usuarios_mobile.senha, super_usuario: @usuarios_mobile.super_usuario }
    assert_redirected_to usuarios_mobile_path(assigns(:usuarios_mobile))
  end

  test "should destroy usuarios_mobile" do
    assert_difference('UsuariosMobile.count', -1) do
      delete :destroy, id: @usuarios_mobile
    end

    assert_redirected_to usuarios_mobiles_path
  end
end
