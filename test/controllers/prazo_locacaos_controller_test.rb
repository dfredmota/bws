require 'test_helper'

class PrazoLocacaosControllerTest < ActionController::TestCase
  setup do
    @prazo_locacao = prazo_locacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prazo_locacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prazo_locacao" do
    assert_difference('PrazoLocacao.count') do
      post :create, prazo_locacao: { descricao: @prazo_locacao.descricao }
    end

    assert_redirected_to prazo_locacao_path(assigns(:prazo_locacao))
  end

  test "should show prazo_locacao" do
    get :show, id: @prazo_locacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prazo_locacao
    assert_response :success
  end

  test "should update prazo_locacao" do
    patch :update, id: @prazo_locacao, prazo_locacao: { descricao: @prazo_locacao.descricao }
    assert_redirected_to prazo_locacao_path(assigns(:prazo_locacao))
  end

  test "should destroy prazo_locacao" do
    assert_difference('PrazoLocacao.count', -1) do
      delete :destroy, id: @prazo_locacao
    end

    assert_redirected_to prazo_locacaos_path
  end
end
