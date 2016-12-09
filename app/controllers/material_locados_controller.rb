class MaterialLocadosController < ApplicationController
  before_action :set_material_locado, only: [:show, :edit, :update, :destroy]

  # GET /material_locados
  # GET /material_locados.json
  def index
    # @material_locados = MaterialLocado.all
    @materiais_locados_grid = initialize_grid(MaterialLocado,# :include => [:funcao, :telefones],
      order: 'id',
      name: 'u1',
      :csv_file_name => "materiais_locados_#{Time.now.strftime('%d%m%y%H%M%S')}")
    export_grid_if_requested('u1' => 'grid') do
    end
  end

  # GET /material_locados/1
  # GET /material_locados/1.json
  def show
  end

  # GET /material_locados/new
  def new
    @material_locado = MaterialLocado.new
  end

  # GET /material_locados/1/edit
  def edit
  end

  # POST /material_locados
  # POST /material_locados.json
  def create
    @material_locado = MaterialLocado.new(material_locado_params)

    respond_to do |format|
      if @material_locado.save
        format.html { redirect_to @material_locado, notice: 'Material locado criado com sucesso.' }
        format.json { render :show, status: :created, location: @material_locado }
      else
        format.html { render :new }
        format.json { render json: @material_locado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_locados/1
  # PATCH/PUT /material_locados/1.json
  def update
    respond_to do |format|
      if @material_locado.update(material_locado_params)
        format.html { redirect_to @material_locado, notice: 'Material locado atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @material_locado }
      else
        format.html { render :edit }
        format.json { render json: @material_locado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_locados/1
  # DELETE /material_locados/1.json
  def destroy
    @material_locado.destroy
    respond_to do |format|
      format.html { redirect_to material_locados_url, notice: 'Material locado excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_locado
      @material_locado = MaterialLocado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_locado_params
      params.require(:material_locado).permit(:descricao, :quantidade)
    end
end
