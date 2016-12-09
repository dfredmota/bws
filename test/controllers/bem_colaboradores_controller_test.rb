require 'test_helper'

class BemColaboradoresControllerTest < ActionController::TestCase
  setup do
    @bem_colaborador = bem_colaboradores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bem_colaboradores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bem_colaborador" do
    assert_difference('BemColaborador.count') do
      post :create, bem_colaborador: { bem_id: @bem_colaborador.bem_id, colaborador_id: @bem_colaborador.colaborador_id, quantidade: @bem_colaborador.quantidade }
    end

    assert_redirected_to bem_colaborador_path(assigns(:bem_colaborador))
  end

  test "should show bem_colaborador" do
    get :show, id: @bem_colaborador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bem_colaborador
    assert_response :success
  end

  test "should update bem_colaborador" do
    patch :update, id: @bem_colaborador, bem_colaborador: { bem_id: @bem_colaborador.bem_id, colaborador_id: @bem_colaborador.colaborador_id, quantidade: @bem_colaborador.quantidade }
    assert_redirected_to bem_colaborador_path(assigns(:bem_colaborador))
  end

  test "should destroy bem_colaborador" do
    assert_difference('BemColaborador.count', -1) do
      delete :destroy, id: @bem_colaborador
    end

    assert_redirected_to bem_colaboradores_path
  end
end
