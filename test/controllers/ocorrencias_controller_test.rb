require 'test_helper'

class OcorrenciasControllerTest < ActionController::TestCase
  setup do
    @ocorrencia = ocorrencias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ocorrencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ocorrencia" do
    assert_difference('Ocorrencia.count') do
      post :create, ocorrencia: { numero_protocolo: @ocorrencia.numero_protocolo, sob_influencia: @ocorrencia.sob_influencia }
    end

    assert_redirected_to ocorrencia_path(assigns(:ocorrencia))
  end

  test "should show ocorrencia" do
    get :show, id: @ocorrencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ocorrencia
    assert_response :success
  end

  test "should update ocorrencia" do
    patch :update, id: @ocorrencia, ocorrencia: { numero_protocolo: @ocorrencia.numero_protocolo, sob_influencia: @ocorrencia.sob_influencia }
    assert_redirected_to ocorrencia_path(assigns(:ocorrencia))
  end

  test "should destroy ocorrencia" do
    assert_difference('Ocorrencia.count', -1) do
      delete :destroy, id: @ocorrencia
    end

    assert_redirected_to ocorrencias_path
  end
end
