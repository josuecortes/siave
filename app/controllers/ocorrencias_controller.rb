class OcorrenciasController < ApplicationController
  before_action :set_ocorrencia, only: [:show, :edit, :update, :destroy]
  before_filter :colecoes
  load_and_authorize_resource :class=>"Ocorrencia", except: :create

  # GET /ocorrencias
  # GET /ocorrencias.json

  def index
    #@ocorrencias = Ocorrencia.all
    @q = Ocorrencia.ransack(params[:q])
    @ocorrencias = @q.result.accessible_by(current_ability).order('created_at DESC').paginate(:page => params[:page], :per_page => @@per_page)

  end

  # GET /ocorrencias/1
  # GET /ocorrencias/1.json
  def show
  end

  def autocomplete_pessoa_nome
    term = params[:term]
    pessoas = Pessoa.where('nome ilike ?',"%#{term}%").order(:nome).all
    render :json => pessoas.map { |pessoa| {:id => pessoa.id,:label => pessoa.nome, :value => pessoa.nome} }
  end

  # GET /ocorrencias/new
  def new
    @ocorrencia = Ocorrencia.new
  end

  # GET /ocorrencias/1/edit
  def edit
    @tipo_ocorrencia = @ocorrencia.tipo_ocorrencia
    @desdobramentos = @tipo_ocorrencia.desdobramentos.collect{|t| [t.descricao, t.id]} if @tipo_ocorrencia
    @tipo_desdobramentos_ocorrencia = @ocorrencia.desdobramento_tipo_ocorrencia.tipo_desdobramentos.collect{|t| [t.descricao, t.id]} if @ocorrencia.desdobramento_tipo_ocorrencia
  end

  # POST /ocorrencias
  # POST /ocorrencias.json
  def create
    @ocorrencia = Ocorrencia.new(ocorrencia_params)

    respond_to do |format|
      if @ocorrencia.save
        format.html { redirect_to @ocorrencia, notice: @@msgs }
        format.json { render :show, status: :created, location: @ocorrencia }
      else
        format.html { render :new, alert: @@msge }
        format.json { render json: @ocorrencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ocorrencias/1
  # PATCH/PUT /ocorrencias/1.json
  def update
    respond_to do |format|
      if @ocorrencia.update(ocorrencia_params)
        format.html { redirect_to @ocorrencia, notice: @@msgs }
        format.json { render :show, status: :ok, location: @ocorrencia }
      else
        format.html { render :edit, alert: @@msge }
        format.json { render json: @ocorrencia.errors, status: :unprocessable_entity }
      end
    end
  end

  def criar_pessoa
    @pessoa = Pessoa.new(pessoa_params)

    respond_to do |format|
      if @pessoa.save
        format.js  {render "pessoa_salva"}
        format.json { render :show, status: :created, location: @pessoa }
      else
        format.js {render "pessoa_nao_salva"}
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocorrencias/1
  # DELETE /ocorrencias/1.json
  def destroy
    @ocorrencia.destroy
    respond_to do |format|
      format.html { redirect_to ocorrencias_url, notice: @@msgs }
      format.json { head :no_content }
    end
  end

  #desdobramento ocorrencia
  def desdobramento_tipo_ocorrencia
    if !params[:tipo_ocorrencia].blank?
      @tipo_ocorrencia = TipoOcorrencia.find(params[:tipo_ocorrencia])
      @desdobramentos = @tipo_ocorrencia.desdobramentos.collect{|t| [t.descricao, t.id]}
      render :partial => "desdobramentos_tipo_ocorrencia"
    else
      render :nothing => true
    end
  end

  def tipo_desdobramento_ocorrencia
    if !params[:desdobramento_tipo_ocorrencia].blank?
      @desdobramento = Desdobramento.find(params[:desdobramento_tipo_ocorrencia])
      @tipo_desdobramentos_ocorrencia = @desdobramento.tipo_desdobramentos.collect{|t| [t.descricao, t.id]}
      render :partial => "tipo_desdobramento_ocorrencia"
    else
      render :nothing => true
    end

  end

  #desdobramento agressor


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ocorrencia
    @ocorrencia = Ocorrencia.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ocorrencia_params
    params.require(:ocorrencia).permit(:numero_protocolo, :sob_influencia, :encaminhamento_id,
                                       :tipo_ocorrencia_id, :tipo_agressor_id, :agredido_id, :agressor_id,
                                       :desdobramento_tipo_ocorrencia_id, :tipo_desdobramento_ocorrencia_id,
                                       :desdobramento_tipo_agressor_id, :tipo_desdobramento_agressor_id )
  end

  def pessoa_params
    params.require(:pessoa).permit(:nome, :data_nascimento, :sexo, :raca, :escolaridade,
                                   :documento, :tipo_documento, :numero_documento, :deficiente,
                                   :tipo_deficiencia, :nome_responsavel, :cep, :numero, :complemento,
                                   contatos_attributes: [:id, :tipo, :numero, :_destroy])
  end

  def colecoes
    @lista_influencias = [['Não','Não'], ['Álcool','Álcool'], ['Outras Drogas','Outras Drogas']]
    @lista_booleans = [['Nao',false], ['Sim',true]]
    @lista_sexos = [['M','M'], ['F','F']]
    @lista_documentos = [['RG','RG'], ['CPF','CPF'], ['CT','CT'], ['CN','CN']]
    @lista_deficiencias = [['FISICA','FISICA'], ['VISUAL','VISUAL'], ['AUDITIVA','AUDITIVA'], ['MENTAL','MENTAL'], ['MULTIPLAS','MULTIPLAS']]
    @lista_escolaridades = [['Fundamental - Incompleto','Fundamental - Incompleto'], ['Fundamental - Completo','Fundamental - Completo'], ['Medio - Incompleto','Medio - Completo'], ['Superior - Incompleto','Superior - Incompleto'], ['Superior - Completo','Superior - Completo']]
    @lista_contatos = [['Residencial','Residencial'], ['Celular','Celular'], ['Trabalho','Trabalho']]
    @pessoa = Pessoa.new
  end
end
