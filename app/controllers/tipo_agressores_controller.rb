class TipoAgressoresController < ApplicationController
  before_action :set_tipo_agressor, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"TipoAgressor", except: :create
  # GET /tipo_agressores
  # GET /tipo_agressores.json
  def index
    #@tipo_agressores = TipoAgressor.all
    @q = TipoAgressor.ransack(params[:q])
    @tipo_agressores = @q.result.accessible_by(current_ability).order('descricao ASC').paginate(:page => params[:page], :per_page => @@per_page)
    
  end

  # GET /tipo_agressores/1
  # GET /tipo_agressores/1.json
  def show
  end

  # GET /tipo_agressores/new
  def new
    @tipo_agressor = TipoAgressor.new
  end

  # GET /tipo_agressores/1/edit
  def edit
  end

  # POST /tipo_agressores
  # POST /tipo_agressores.json
  def create
    @tipo_agressor = TipoAgressor.new(tipo_agressor_params)

    respond_to do |format|
      if @tipo_agressor.save
        format.html { redirect_to @tipo_agressor, notice: 'Tipo agressor was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_agressor }
      else
        format.html { render :new }
        format.json { render json: @tipo_agressor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_agressores/1
  # PATCH/PUT /tipo_agressores/1.json
  def update
    respond_to do |format|
      if @tipo_agressor.update(tipo_agressor_params)
        format.html { redirect_to @tipo_agressor, notice: 'Tipo agressor was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_agressor }
      else
        format.html { render :edit }
        format.json { render json: @tipo_agressor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_agressores/1
  # DELETE /tipo_agressores/1.json
  def destroy
    @tipo_agressor.destroy
    respond_to do |format|
      format.html { redirect_to tipo_agressores_url, notice: 'Tipo agressor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_agressor
      @tipo_agressor = TipoAgressor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_agressor_params
      params.require(:tipo_agressor).permit(:descricao)
    end
end
