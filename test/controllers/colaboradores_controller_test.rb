require 'test_helper'

class ColaboradoresControllerTest < ActionController::TestCase
  setup do
    @colaborador = colaboradores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colaboradores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colaborador" do
    assert_difference('Colaborador.count') do
      post :create, colaborador: { cpf: @colaborador.cpf, data_admissao: @colaborador.data_admissao, data_demissao: @colaborador.data_demissao, data_nascimento: @colaborador.data_nascimento, deleted_at: @colaborador.deleted_at, funcao_id: @colaborador.funcao_id, nome: @colaborador.nome }
    end

    assert_redirected_to colaborador_path(assigns(:colaborador))
  end

  test "should show colaborador" do
    get :show, id: @colaborador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colaborador
    assert_response :success
  end

  test "should update colaborador" do
    patch :update, id: @colaborador, colaborador: { cpf: @colaborador.cpf, data_admissao: @colaborador.data_admissao, data_demissao: @colaborador.data_demissao, data_nascimento: @colaborador.data_nascimento, deleted_at: @colaborador.deleted_at, funcao_id: @colaborador.funcao_id, nome: @colaborador.nome }
    assert_redirected_to colaborador_path(assigns(:colaborador))
  end

  test "should destroy colaborador" do
    assert_difference('Colaborador.count', -1) do
      delete :destroy, id: @colaborador
    end

    assert_redirected_to colaboradores_path
  end
end
