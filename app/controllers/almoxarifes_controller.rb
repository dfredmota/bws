class AlmoxarifesController < ApplicationController
  before_action :set_almoxarife, only: [:show, :edit, :update, :destroy]

  # GET /almoxarifes
  # GET /almoxarifes.json
  def index
    @almoxarifes = Almoxarife.all
  end

  # GET /almoxarifes/1
  # GET /almoxarifes/1.json
  def show
  end

  # GET /almoxarifes/new
  def new
    @almoxarife = Almoxarife.new
  end

  # GET /almoxarifes/1/edit
  def edit
  end

  # POST /almoxarifes
  # POST /almoxarifes.json
  def create
    @almoxarife = Almoxarife.new(almoxarife_params)

    respond_to do |format|
      if @almoxarife.save
        format.html { redirect_to @almoxarife, notice: 'Almoxarife criado com sucesso.' }
        format.json { render :show, status: :created, location: @almoxarife }
      else
        format.html { render :new }
        format.json { render json: @almoxarife.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /almoxarifes/1
  # PATCH/PUT /almoxarifes/1.json
  def update
    respond_to do |format|
      if @almoxarife.update(almoxarife_params)
        format.html { redirect_to @almoxarife, notice: 'Almoxarife atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @almoxarife }
      else
        format.html { render :edit }
        format.json { render json: @almoxarife.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /almoxarifes/1
  # DELETE /almoxarifes/1.json
  def destroy
    @almoxarife.destroy
    respond_to do |format|
      format.html { redirect_to almoxarifes_url, notice: 'Almoxarife excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_almoxarife
      @almoxarife = Almoxarife.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def almoxarife_params
      params.require(:almoxarife).permit(:colaborador_id, :centro_custo_id)
    end
end
