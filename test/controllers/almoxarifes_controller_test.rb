require 'test_helper'

class AlmoxarifesControllerTest < ActionController::TestCase
  setup do
    @almoxarife = almoxarifes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:almoxarifes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create almoxarife" do
    assert_difference('Almoxarife.count') do
      post :create, almoxarife: { centro_custo_id: @almoxarife.centro_custo_id, colaborador_id: @almoxarife.colaborador_id }
    end

    assert_redirected_to almoxarife_path(assigns(:almoxarife))
  end

  test "should show almoxarife" do
    get :show, id: @almoxarife
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @almoxarife
    assert_response :success
  end

  test "should update almoxarife" do
    patch :update, id: @almoxarife, almoxarife: { centro_custo_id: @almoxarife.centro_custo_id, colaborador_id: @almoxarife.colaborador_id }
    assert_redirected_to almoxarife_path(assigns(:almoxarife))
  end

  test "should destroy almoxarife" do
    assert_difference('Almoxarife.count', -1) do
      delete :destroy, id: @almoxarife
    end

    assert_redirected_to almoxarifes_path
  end
end
