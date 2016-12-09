require 'test_helper'

class EstadoConservacoesControllerTest < ActionController::TestCase
  setup do
    @estado_conservacao = estado_conservacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estado_conservacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_conservacao" do
    assert_difference('EstadoConservacao.count') do
      post :create, estado_conservacao: { descricao: @estado_conservacao.descricao }
    end

    assert_redirected_to estado_conservacao_path(assigns(:estado_conservacao))
  end

  test "should show estado_conservacao" do
    get :show, id: @estado_conservacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estado_conservacao
    assert_response :success
  end

  test "should update estado_conservacao" do
    patch :update, id: @estado_conservacao, estado_conservacao: { descricao: @estado_conservacao.descricao }
    assert_redirected_to estado_conservacao_path(assigns(:estado_conservacao))
  end

  test "should destroy estado_conservacao" do
    assert_difference('EstadoConservacao.count', -1) do
      delete :destroy, id: @estado_conservacao
    end

    assert_redirected_to estado_conservacoes_path
  end
end
