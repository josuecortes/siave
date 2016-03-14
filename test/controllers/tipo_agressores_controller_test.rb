require 'test_helper'

class TipoAgressoresControllerTest < ActionController::TestCase
  setup do
    @tipo_agressor = tipo_agressores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_agressores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_agressor" do
    assert_difference('TipoAgressor.count') do
      post :create, tipo_agressor: { descricao: @tipo_agressor.descricao }
    end

    assert_redirected_to tipo_agressor_path(assigns(:tipo_agressor))
  end

  test "should show tipo_agressor" do
    get :show, id: @tipo_agressor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_agressor
    assert_response :success
  end

  test "should update tipo_agressor" do
    patch :update, id: @tipo_agressor, tipo_agressor: { descricao: @tipo_agressor.descricao }
    assert_redirected_to tipo_agressor_path(assigns(:tipo_agressor))
  end

  test "should destroy tipo_agressor" do
    assert_difference('TipoAgressor.count', -1) do
      delete :destroy, id: @tipo_agressor
    end

    assert_redirected_to tipo_agressores_path
  end
end
