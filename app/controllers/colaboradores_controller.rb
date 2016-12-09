class ColaboradoresController < ApplicationController
  before_action :set_colaborador, only: [:show, :edit, :update, :destroy]

  # GET /colaboradores
  # GET /colaboradores.json
  def index
    @colaboradores_grid = initialize_grid(Colaborador.order(:nome), :include => [:funcao, :telefones],
      order: 'id',
      name: 'u1',
      :csv_file_name => "colaboradores_#{Time.now.strftime('%d%m%y%H%M%S')}")
    export_grid_if_requested('u1' => 'grid') do
    end
  end

  # GET /colaboradores/1
  # GET /colaboradores/1.json
  def show
  end

  # GET /colaboradores/new
  def new
    @colaborador = Colaborador.new
  end

  # GET /colaboradores/1/edit
  def edit
  end

  # POST /colaboradores
  # POST /colaboradores.json
  def create
    @colaborador = Colaborador.new(colaborador_params)

    respond_to do |format|
      if @colaborador.save
        format.html { redirect_to @colaborador, notice: t('messages.cadastro_sucesso', :model => "Colaborador")}
        format.json { render :show, status: :created, location: @colaborador }
      else
        format.html { render :new }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colaboradores/1
  # PATCH/PUT /colaboradores/1.json
  def update
    respond_to do |format|
      if @colaborador.update(colaborador_params)
        format.html { redirect_to @colaborador, notice: t('messages.atualizado_sucesso', :model => "Colaborador") }
        format.json { render :show, status: :ok, location: @colaborador }
      else
        format.html { render :edit }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colaboradores/1
  # DELETE /colaboradores/1.json
  def destroy

    respond_to do |format|
      if @colaborador.destroy
        format.html { redirect_to colaboradores_url, notice: t('messages.delecao_sucesso', :model => "Colaborador") }
        format.json { head :no_content }
      else
        format.html { redirect_to colaboradores_url, alert: @colaborador.errors.full_messages.join(', ') }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colaborador
      @colaborador = Colaborador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colaborador_params
      params.require(:colaborador).permit(:nome, :cpf, :data_nascimento, :funcao_id, :data_admissao, :data_demissao, :deleted_at, telefones_attributes: [:id, :ddd, :numero, :_destroy])
    end
end
