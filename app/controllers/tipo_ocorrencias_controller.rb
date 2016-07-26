class TipoOcorrenciasController < ApplicationController
  before_action :set_tipo_ocorrencia, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"TipoOcorrencia", except: :create

  # GET /tipo_ocorrencias
  # GET /tipo_ocorrencias.json
  def index
    #@tipo_ocorrencias = TipoOcorrencia.all
    @q = TipoOcorrencia.ransack(params[:q])
    @tipo_ocorrencias = @q.result.accessible_by(current_ability).order('descricao ASC').paginate(:page => params[:page], :per_page => @@per_page)
    
  end

  # GET /tipo_ocorrencias/1
  # GET /tipo_ocorrencias/1.json
  def show
  end

  # GET /tipo_ocorrencias/new
  def new
    @tipo_ocorrencia = TipoOcorrencia.new
  end

  # GET /tipo_ocorrencias/1/edit
  def edit
  end

  # POST /tipo_ocorrencias
  # POST /tipo_ocorrencias.json
  def create
    @tipo_ocorrencia = TipoOcorrencia.new(tipo_ocorrencia_params)

    respond_to do |format|
      if @tipo_ocorrencia.save
        format.html { redirect_to @tipo_ocorrencia, notice: @@msgs }
        format.json { render :show, status: :created, location: @tipo_ocorrencia }
      else
        format.html { render :new, alert: @@msge }
        format.json { render json: @tipo_ocorrencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_ocorrencias/1
  # PATCH/PUT /tipo_ocorrencias/1.json
  def update
    respond_to do |format|
      if @tipo_ocorrencia.update(tipo_ocorrencia_params)
        format.html { redirect_to @tipo_ocorrencia, notice: @@msgs }
        format.json { render :show, status: :ok, location: @tipo_ocorrencia }
      else
        format.html { render :edit, alert: @@msge }
        format.json { render json: @tipo_ocorrencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_ocorrencias/1
  # DELETE /tipo_ocorrencias/1.json
  def destroy
    @tipo_ocorrencia.destroy
    respond_to do |format|
      format.html { redirect_to tipo_ocorrencias_url, notice: @@msgs }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_ocorrencia
      @tipo_ocorrencia = TipoOcorrencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_ocorrencia_params
      params.require(:tipo_ocorrencia).permit(:descricao)
    end
end
