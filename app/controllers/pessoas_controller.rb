class PessoasController < ApplicationController
  before_action :set_pessoa, only: [:show, :edit, :update, :destroy]
  before_filter :colecoes
  load_and_authorize_resource :class=>"Pessoa", except: :create

  # GET /pessoas
  # GET /pessoas.json
  def index
    #@pessoas = Pessoa.all
    @q = Pessoa.ransack(params[:q])
    @pessoas = @q.result.accessible_by(current_ability).order('nome ASC').paginate(:page => params[:page], :per_page => @@per_page)
    

  end

  # GET /pessoas/1
  # GET /pessoas/1.json
  def show
  end

  # GET /pessoas/new
  def new
    @pessoa = Pessoa.new
    @contato = @pessoa.contatos.build
    
  end

  # GET /pessoas/1/edit
  def edit
    
  end

  # POST /pessoas
  # POST /pessoas.json
  def create
    @pessoa = Pessoa.new(pessoa_params)

    respond_to do |format|
      if @pessoa.save
        format.html { redirect_to @pessoa, notice: @@msgs }
        format.json { render :show, status: :created, location: @pessoa }
      else
        format.html { render :new, alert: @@msge }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pessoas/1
  # PATCH/PUT /pessoas/1.json
  def update
    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html { redirect_to @pessoa, notice: @@msgs }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { render :edit, alert: @@msge }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1
  # DELETE /pessoas/1.json
  def destroy
    @pessoa.destroy
    respond_to do |format|
      format.html { redirect_to pessoas_url, notice: @@msgs }
      format.json { head :no_content }
    end
  end
  
  def atributos_documento
    if params[:documento] == 'true'
      render :partial => "atributos_documento"
    else
      render :nothing => true
    end
  end

  def atributos_deficiente
    if params[:deficiente] == 'true'
      render :partial => "atributos_deficiente"
    else
      render :nothing => true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = Pessoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoa_params
      params.require(:pessoa).permit(:nome, :data_nascimento, :sexo, :raca, :escolaridade, 
                                      :documento, :tipo_documento, :numero_documento, :deficiente,
                                      :tipo_deficiencia, :nome_responsavel, :cep, :numero, :complemento,
                                      contatos_attributes: [:id, :tipo, :numero, :_destroy])
    end

    def colecoes
      @lista_booleans = [['NAO',false], ['SIM',true]]
      @lista_sexos = [['M','M'], ['F','F']]
      @lista_documentos = [['RG','RG'], ['CPF','CPF'], ['CT','CT'], ['CN','CN']]
      @lista_deficiencias = [['FISICA','FISICA'], ['VISUAL','VISUAL'], ['AUDITIVA','AUDITIVA'], ['MENTAL','MENTAL'], ['MULTIPLAS','MULTIPLAS']]
      @lista_escolaridades = [['FUNDAMENTAL - INCOMPLETO','FUNDAMENTAL - INCOMPLETO'], ['FUNDAMENTAL - COMPLETO','FUNDAMENTAL - COMPLETO'], ['MEDIO - INCOMPLETO','MEDIO - COMPLETO'], ['SUPERIOR - INCOMPLETO','SUPERIOR - INCOMPLETO'], ['SUPERIOR - COMPLETO','SUPERIOR - COMPLETO']]
      @lista_contatos = [['RESIDENCIAL','RESIDENCIAL'], ['CELULAR','CELULAR'], ['TRABALHO','TRABALHO']]
      @lista_racas = [['BRANCA','BRANCA'], ['PRETA','PRETA'], ['PARDA','PARDA'], ['INDIGENA','INDIGENA'], ['AMARELA','AMARELA']]
      

    end
end
