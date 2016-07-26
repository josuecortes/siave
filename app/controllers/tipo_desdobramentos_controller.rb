class TipoDesdobramentosController < ApplicationController
  before_action :set_tipo_desdobramento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"TipoDesdobramento", except: :create
  
  # GET /tipo_desdobramentos
  # GET /tipo_desdobramentos.json
  def index
    #@tipo_desdobramentos = TipoDesdobramento.all
    #@desdobramentos = Desdobramento.all
    @q = TipoDesdobramento.ransack(params[:q])
    @tipo_desdobramentos = @q.result.accessible_by(current_ability).order('descricao ASC').paginate(:page => params[:page], :per_page => @@per_page)
    
  end

  # GET /tipo_desdobramentos/1
  # GET /tipo_desdobramentos/1.json
  def show
  end

  # GET /tipo_desdobramentos/new
  def new
    @tipo_desdobramento = TipoDesdobramento.new
  end

  # GET /tipo_desdobramentos/1/edit
  def edit
  end

  # POST /tipo_desdobramentos
  # POST /tipo_desdobramentos.json
  def create
    @tipo_desdobramento = TipoDesdobramento.new(tipo_desdobramento_params)

    respond_to do |format|
      if @tipo_desdobramento.save
        format.html { redirect_to @tipo_desdobramento, notice: @@msgs }
        format.json { render :show, status: :created, location: @tipo_desdobramento }
      else
        format.html { render :new }
        format.json { render json: @tipo_desdobramento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_desdobramentos/1
  # PATCH/PUT /tipo_desdobramentos/1.json
  def update
    respond_to do |format|
      if @tipo_desdobramento.update(tipo_desdobramento_params)
        format.html { redirect_to @tipo_desdobramento, notice: @@msgs }
        format.json { render :show, status: :ok, location: @tipo_desdobramento }
      else
        format.html { render :edit }
        format.json { render json: @tipo_desdobramento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_desdobramentos/1
  # DELETE /tipo_desdobramentos/1.json
  def destroy
    @tipo_desdobramento.destroy
    respond_to do |format|
      format.html { redirect_to tipo_desdobramentos_url, notice: @@msgs }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_desdobramento
      @tipo_desdobramento = TipoDesdobramento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_desdobramento_params
      params.require(:tipo_desdobramento).permit(:descricao, :desdobramento_id)
    end
end
