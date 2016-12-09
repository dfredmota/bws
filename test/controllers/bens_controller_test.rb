require 'test_helper'

class BensControllerTest < ActionController::TestCase
  setup do
    @bem = bens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bem" do
    assert_difference('Bem.count') do
      post :create, bem: { centro_custo_id: @bem.centro_custo_id, colaborador_id: @bem.colaborador_id, data_compra: @bem.data_compra, detalhamento: @bem.detalhamento, estado_conservacao: @bem.estado_conservacao, grupo_insumo: @bem.grupo_insumo, insumo: @bem.insumo, marca: @bem.marca, modelo: @bem.modelo, nota_fiscal: @bem.nota_fiscal, numero_serie: @bem.numero_serie, observacao: @bem.observacao, setor_id: @bem.setor_id, situacao_id: @bem.situacao_id, tipo_bem_id: @bem.tipo_bem_id, valor: @bem.valor }
    end

    assert_redirected_to bem_path(assigns(:bem))
  end

  test "should show bem" do
    get :show, id: @bem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bem
    assert_response :success
  end

  test "should update bem" do
    patch :update, id: @bem, bem: { centro_custo_id: @bem.centro_custo_id, colaborador_id: @bem.colaborador_id, data_compra: @bem.data_compra, detalhamento: @bem.detalhamento, estado_conservacao: @bem.estado_conservacao, grupo_insumo: @bem.grupo_insumo, insumo: @bem.insumo, marca: @bem.marca, modelo: @bem.modelo, nota_fiscal: @bem.nota_fiscal, numero_serie: @bem.numero_serie, observacao: @bem.observacao, setor_id: @bem.setor_id, situacao_id: @bem.situacao_id, tipo_bem_id: @bem.tipo_bem_id, valor: @bem.valor }
    assert_redirected_to bem_path(assigns(:bem))
  end

  test "should destroy bem" do
    assert_difference('Bem.count', -1) do
      delete :destroy, id: @bem
    end

    assert_redirected_to bens_path
  end
end
