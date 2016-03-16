class EscolasController < ApplicationController
  before_action :set_escola, only: [:show, :edit, :update, :destroy]
  before_filter :colecoes
  load_and_authorize_resource :class=>"Escola", except: :create

  # GET /escolas
  # GET /escolas.json
  def index
    #@escolas = Escola.all
    @q = Escola.ransack(params[:q])
    @escolas = @q.result.accessible_by(current_ability).order('nome ASC').paginate(:page => params[:page], :per_page => @@per_page)
    
  end

  # GET /escolas/1
  # GET /escolas/1.json
  def show
  end

  # GET /escolas/new
  def new
    @escola = Escola.new
  end

  # GET /escolas/1/edit
  def edit
  end

  # POST /escolas
  # POST /escolas.json
  def create
    @escola = Escola.new(escola_params)

    respond_to do |format|
      if @escola.save
        format.html { redirect_to @escola, notice: @@msgs }
        format.json { render :show, status: :created, location: @escola }
      else
        format.html { render :new, alert: @@msge }
        format.json { render json: @escola.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escolas/1
  # PATCH/PUT /escolas/1.json
  def update
    respond_to do |format|
      if @escola.update(escola_params)
        format.html { redirect_to @escola, notice: @@msgs }
        format.json { render :show, status: :ok, location: @escola }
      else
        format.html { render :edit, alert: @@msge }
        format.json { render json: @escola.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escolas/1
  # DELETE /escolas/1.json
  def destroy
    @escola.destroy
    respond_to do |format|
      format.html { redirect_to escolas_url, notice: @@msgs }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escola
      @escola = Escola.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def escola_params
      params.require(:escola).permit(:codigo, :nome, :cep, :numero, :email, :contato,:municipio)
    end

    def colecoes
      @municipios = ["AMAPA", "CALCOENE", "FERREIRA GOMES", "MAZAGAO", "OIAPOQUE", "PORTO GRANDE", "SANTANA", "TARTARUGALZINHO", "PRACUUBA", "ITAUBAL", "CUTIAS", "PEDRA BRANCA DO AMAPARI", "MACAPA", "LARANJAL DO JARI", "VITORIA DO JARI", "SERRA DO NAVIO"]
    end
end
