require 'test_helper'

class DesdobramentosControllerTest < ActionController::TestCase
  setup do
    @desdobramento = desdobramentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:desdobramentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create desdobramento" do
    assert_difference('Desdobramento.count') do
      post :create, desdobramento: { descricao: @desdobramento.descricao, tipo_agressor_id: @desdobramento.tipo_agressor_id, tipo_ocorrencia_id: @desdobramento.tipo_ocorrencia_id }
    end

    assert_redirected_to desdobramento_path(assigns(:desdobramento))
  end

  test "should show desdobramento" do
    get :show, id: @desdobramento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @desdobramento
    assert_response :success
  end

  test "should update desdobramento" do
    patch :update, id: @desdobramento, desdobramento: { descricao: @desdobramento.descricao, tipo_agressor_id: @desdobramento.tipo_agressor_id, tipo_ocorrencia_id: @desdobramento.tipo_ocorrencia_id }
    assert_redirected_to desdobramento_path(assigns(:desdobramento))
  end

  test "should destroy desdobramento" do
    assert_difference('Desdobramento.count', -1) do
      delete :destroy, id: @desdobramento
    end

    assert_redirected_to desdobramentos_path
  end
end
