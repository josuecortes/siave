require 'test_helper'

class EncaminhamentosControllerTest < ActionController::TestCase
  setup do
    @encaminhamento = encaminhamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:encaminhamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create encaminhamento" do
    assert_difference('Encaminhamento.count') do
      post :create, encaminhamento: { descricao: @encaminhamento.descricao }
    end

    assert_redirected_to encaminhamento_path(assigns(:encaminhamento))
  end

  test "should show encaminhamento" do
    get :show, id: @encaminhamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @encaminhamento
    assert_response :success
  end

  test "should update encaminhamento" do
    patch :update, id: @encaminhamento, encaminhamento: { descricao: @encaminhamento.descricao }
    assert_redirected_to encaminhamento_path(assigns(:encaminhamento))
  end

  test "should destroy encaminhamento" do
    assert_difference('Encaminhamento.count', -1) do
      delete :destroy, id: @encaminhamento
    end

    assert_redirected_to encaminhamentos_path
  end
end
