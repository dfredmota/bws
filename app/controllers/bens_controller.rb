#encoding: utf-8
class BensController < ApplicationController
  before_action :set_bem, only: [:show, :edit, :update, :destroy]

  # GET /bens
  # GET /bens.json
  def index
    # @bens = Bem.all
    @bens_grid = initialize_grid(Bem, :include => [:situacao, :centro_custo, :setor, :tipo_bem],
        order: 'id',
        name: 'u1',
        :csv_file_name => "listagem_de_bens_#{Time.now.strftime('%d%m%y%H%M%S')}")
      export_grid_if_requested('u1' => 'grid') do
      end
  end

  # GET /bens/1
  # GET /bens/1.json
  def show
  end

  # GET /bens/new
  def new
    @bem = Bem.new
  end

  # GET /bens/1/edit
  def edit
  end

  # POST /bens
  # POST /bens.json
  def create
    @bem = Bem.new(bem_params)

    respond_to do |format|
      if @bem.save
        format.html { redirect_to bens_path, notice: t('messages.cadastro_sucesso', :model => "Item") }
        format.json { render :show, status: :created, location: @bem }
      else
        format.html { render :new }
        format.json { render json: @bem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bens/1
  # PATCH/PUT /bens/1.json
  def update
    respond_to do |format|
      if @bem.update(bem_params)
        format.html { redirect_to bens_path, notice: t('messages.atualizado_sucesso', :model => "Item") }
        format.json { render :show, status: :ok, location: @bem }
      else
        format.html { render :edit }
        format.json { render json: @bem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bens/1
  # DELETE /bens/1.json
  def destroy
    @bem.destroy
    respond_to do |format|
      format.html { redirect_to bens_url, notice: t('messages.delecao_sucesso', :model => "Item") }
      format.json { head :no_content }
    end
  end

  def gera_patrimonio
    pat = Bem.gera_patrimonio
    render text: pat, layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bem
      @bem = Bem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bem_params
      params.require(:bem).permit(:grupo_insumo_id, :insumo_id, :marca, :modelo, :numero_serie, :detalhamento, :observacao, :valor, :nota_fiscal, :data_compra, :situacao_id, :estado_conservacao_id, :centro_custo_id, :setor_id, :colaborador_id, :tipo_bem_id, :qtd_disponivel, :patrimonio)
    end
end
