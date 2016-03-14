class DesdobramentosController < ApplicationController
  before_action :set_desdobramento, only: [:show, :edit, :update, :destroy]
  before_filter :colecoes
  load_and_authorize_resource :class=>"Desdobramento", except: :create

  # GET /desdobramentos
  # GET /desdobramentos.json
  def index
    #@desdobramentos = Desdobramento.all
    @q = Desdobramento.ransack(params[:q])
    @desdobramentos = @q.result.accessible_by(current_ability).order('created_at ASC').paginate(:page => params[:page], :per_page => @@per_page)
    
  end

  # GET /desdobramentos/1
  # GET /desdobramentos/1.json
  def show
  end

  # GET /desdobramentos/new
  def new
    @desdobramento = Desdobramento.new
  end

  # GET /desdobramentos/1/edit
  def edit
  end

  # POST /desdobramentos
  # POST /desdobramentos.json
  def create
    @desdobramento = Desdobramento.new(desdobramento_params)

    respond_to do |format|
      if @desdobramento.save
        format.html { redirect_to @desdobramento, notice: @@msgs }
        format.json { render :show, status: :created, location: @desdobramento }
      else
        format.html { render :new, alert: @@msge }
        format.json { render json: @desdobramento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desdobramentos/1
  # PATCH/PUT /desdobramentos/1.json
  def update
    respond_to do |format|
      if @desdobramento.update(desdobramento_params)
        format.html { redirect_to @desdobramento, notice: @@msgs }
        format.json { render :show, status: :ok, location: @desdobramento }
      else
        format.html { render :edit, alert: @@msge }
        format.json { render json: @desdobramento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desdobramentos/1
  # DELETE /desdobramentos/1.json
  def destroy
    @desdobramento.destroy
    respond_to do |format|
      format.html { redirect_to desdobramentos_url, notice: @@msgs }
      format.json { head :no_content }
    end
  end

  def atributos_tipo
    if params[:tipo] == 'Ocorrencia'
      render :partial => "atributos_ocorrencias"
    elsif params[:tipo] == 'Agressoes'
      render :partial => "atributos_agressoes"
    else
      render :nothing => true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desdobramento
      @desdobramento = Desdobramento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def desdobramento_params
      params.require(:desdobramento).permit(:descricao, :tipo, :tipo_ocorrencia_id, :tipo_agressor_id)
    end

    def colecoes
      @lista_tipos = [['Ocorrencia','Ocorrencia'], ['Agressoes','Agressoes']]
    end
end
