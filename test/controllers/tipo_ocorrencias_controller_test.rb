require 'test_helper'

class TipoOcorrenciasControllerTest < ActionController::TestCase
  setup do
    @tipo_ocorrencia = tipo_ocorrencias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_ocorrencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_ocorrencia" do
    assert_difference('TipoOcorrencia.count') do
      post :create, tipo_ocorrencia: { descricao: @tipo_ocorrencia.descricao }
    end

    assert_redirected_to tipo_ocorrencia_path(assigns(:tipo_ocorrencia))
  end

  test "should show tipo_ocorrencia" do
    get :show, id: @tipo_ocorrencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_ocorrencia
    assert_response :success
  end

  test "should update tipo_ocorrencia" do
    patch :update, id: @tipo_ocorrencia, tipo_ocorrencia: { descricao: @tipo_ocorrencia.descricao }
    assert_redirected_to tipo_ocorrencia_path(assigns(:tipo_ocorrencia))
  end

  test "should destroy tipo_ocorrencia" do
    assert_difference('TipoOcorrencia.count', -1) do
      delete :destroy, id: @tipo_ocorrencia
    end

    assert_redirected_to tipo_ocorrencias_path
  end
end
