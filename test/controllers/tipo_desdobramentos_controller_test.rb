require 'test_helper'

class TipoDesdobramentosControllerTest < ActionController::TestCase
  setup do
    @tipo_desdobramento = tipo_desdobramentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_desdobramentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_desdobramento" do
    assert_difference('TipoDesdobramento.count') do
      post :create, tipo_desdobramento: { descricao: @tipo_desdobramento.descricao, desdobramento_id: @tipo_desdobramento.desdobramento_id }
    end

    assert_redirected_to tipo_desdobramento_path(assigns(:tipo_desdobramento))
  end

  test "should show tipo_desdobramento" do
    get :show, id: @tipo_desdobramento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_desdobramento
    assert_response :success
  end

  test "should update tipo_desdobramento" do
    patch :update, id: @tipo_desdobramento, tipo_desdobramento: { descricao: @tipo_desdobramento.descricao, desdobramento_id: @tipo_desdobramento.desdobramento_id }
    assert_redirected_to tipo_desdobramento_path(assigns(:tipo_desdobramento))
  end

  test "should destroy tipo_desdobramento" do
    assert_difference('TipoDesdobramento.count', -1) do
      delete :destroy, id: @tipo_desdobramento
    end

    assert_redirected_to tipo_desdobramentos_path
  end
end
