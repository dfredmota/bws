class CentroCustosController < ApplicationController
  before_action :set_centro_custo, only: [:show, :edit, :update, :destroy]

  # GET /centro_custos
  # GET /centro_custos.json
  def index
    @centro_custos = CentroCusto.all.order(:descricao)
  end

  # GET /centro_custos/1
  # GET /centro_custos/1.json
  def show
  end

  # GET /centro_custos/new
  def new
    @centro_custo = CentroCusto.new
  end

  # GET /centro_custos/1/edit
  def edit
  end

  # POST /centro_custos
  # POST /centro_custos.json
  def create
    @centro_custo = CentroCusto.new(centro_custo_params)

    respond_to do |format|
      if @centro_custo.save
        format.html { redirect_to @centro_custo, notice: 'Centro custo criado com sucesso.' }
        format.json { render :show, status: :created, location: @centro_custo }
      else
        format.html { render :new }
        format.json { render json: @centro_custo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centro_custos/1
  # PATCH/PUT /centro_custos/1.json
  def update
    respond_to do |format|
      if @centro_custo.update(centro_custo_params)
        format.html { redirect_to @centro_custo, notice: 'Centro custo atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @centro_custo }
      else
        format.html { render :edit }
        format.json { render json: @centro_custo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centro_custos/1
  # DELETE /centro_custos/1.json
  def destroy
    @centro_custo.destroy
    respond_to do |format|
      format.html { redirect_to centro_custos_url, notice: 'Centro custo excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centro_custo
      @centro_custo = CentroCusto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def centro_custo_params
      params.require(:centro_custo).permit(:descricao)
    end
end
