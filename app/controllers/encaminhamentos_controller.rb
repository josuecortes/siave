class EncaminhamentosController < ApplicationController
  before_action :set_encaminhamento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"Encaminhamento", except: :create

  # GET /encaminhamentos
  # GET /encaminhamentos.json
  def index
    #@encaminhamentos = Encaminhamento.all
    @q = Encaminhamento.ransack(params[:q])
    @encaminhamentos = @q.result.accessible_by(current_ability).order('descricao ASC').paginate(:page => params[:page], :per_page => @@per_page)
    
  end

  # GET /encaminhamentos/1
  # GET /encaminhamentos/1.json
  def show
  end

  # GET /encaminhamentos/new
  def new
    @encaminhamento = Encaminhamento.new
  end

  # GET /encaminhamentos/1/edit
  def edit
  end

  # POST /encaminhamentos
  # POST /encaminhamentos.json
  def create
    @encaminhamento = Encaminhamento.new(encaminhamento_params)

    respond_to do |format|
      if @encaminhamento.save
        format.html { redirect_to @encaminhamento, notice: @@msgs }
        format.json { render :show, status: :created, location: @encaminhamento }
      else
        format.html { render :new, alert: @@msge }
        format.json { render json: @encaminhamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encaminhamentos/1
  # PATCH/PUT /encaminhamentos/1.json
  def update
    respond_to do |format|
      if @encaminhamento.update(encaminhamento_params)
        format.html { redirect_to @encaminhamento, notice: @@msgs }
        format.json { render :show, status: :ok, location: @encaminhamento }
      else
        format.html { render :edit, alert: @@msge }
        format.json { render json: @encaminhamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encaminhamentos/1
  # DELETE /encaminhamentos/1.json
  def destroy
    @encaminhamento.destroy
    respond_to do |format|
      format.html { redirect_to encaminhamentos_url, notice: @@msgs }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encaminhamento
      @encaminhamento = Encaminhamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encaminhamento_params
      params.require(:encaminhamento).permit(:descricao)
    end
end
