require 'test_helper'

class PessoasControllerTest < ActionController::TestCase
  setup do
    @pessoa = pessoas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pessoas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pessoa" do
    assert_difference('Pessoa.count') do
      post :create, pessoa: { cep: @pessoa.cep, complemento: @pessoa.complemento, data_nascimento: @pessoa.data_nascimento, deficiente: @pessoa.deficiente, escolaridade: @pessoa.escolaridade, nome: @pessoa.nome, nome_responsavel: @pessoa.nome_responsavel, numero: @pessoa.numero, numero_documento: @pessoa.numero_documento, raca: @pessoa.raca, sexo: @pessoa.sexo, tipo_deficiencia: @pessoa.tipo_deficiencia, tipo_documento: @pessoa.tipo_documento }
    end

    assert_redirected_to pessoa_path(assigns(:pessoa))
  end

  test "should show pessoa" do
    get :show, id: @pessoa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pessoa
    assert_response :success
  end

  test "should update pessoa" do
    patch :update, id: @pessoa, pessoa: { cep: @pessoa.cep, complemento: @pessoa.complemento, data_nascimento: @pessoa.data_nascimento, deficiente: @pessoa.deficiente, escolaridade: @pessoa.escolaridade, nome: @pessoa.nome, nome_responsavel: @pessoa.nome_responsavel, numero: @pessoa.numero, numero_documento: @pessoa.numero_documento, raca: @pessoa.raca, sexo: @pessoa.sexo, tipo_deficiencia: @pessoa.tipo_deficiencia, tipo_documento: @pessoa.tipo_documento }
    assert_redirected_to pessoa_path(assigns(:pessoa))
  end

  test "should destroy pessoa" do
    assert_difference('Pessoa.count', -1) do
      delete :destroy, id: @pessoa
    end

    assert_redirected_to pessoas_path
  end
end
