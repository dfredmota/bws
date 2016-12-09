class PrazoLocacoesController < ApplicationController
  before_action :set_prazo_locacao, only: [:show, :edit, :update, :destroy]

  # GET /prazo_locacoes
  # GET /prazo_locacoes.json
  def index
    @prazo_locacoes = PrazoLocacao.all
  end

  # GET /prazo_locacoes/1
  # GET /prazo_locacoes/1.json
  def show
  end

  # GET /prazo_locacoes/new
  def new
    @prazo_locacao = PrazoLocacao.new
  end

  # GET /prazo_locacoes/1/edit
  def edit
  end

  # POST /prazo_locacoes
  # POST /prazo_locacoes.json
  def create
    @prazo_locacao = PrazoLocacao.new(prazo_locacao_params)

    respond_to do |format|
      if @prazo_locacao.save
        format.html { redirect_to @prazo_locacao, notice: 'Prazo de Locação criado com sucesso.' }
        format.json { render :show, status: :created, location: @prazo_locacao }
      else
        format.html { render :new }
        format.json { render json: @prazo_locacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prazo_locacoes/1
  # PATCH/PUT /prazo_locacoes/1.json
  def update
    respond_to do |format|
      if @prazo_locacao.update(prazo_locacao_params)
        format.html { redirect_to @prazo_locacao, notice: 'Prazo de locação atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @prazo_locacao }
      else
        format.html { render :edit }
        format.json { render json: @prazo_locacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prazo_locacoes/1
  # DELETE /prazo_locacoes/1.json
  def destroy
    @prazo_locacao.destroy
    respond_to do |format|
      format.html { redirect_to prazo_locacoes_url, notice: 'Prazo de locação excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prazo_locacao
      @prazo_locacao = PrazoLocacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prazo_locacao_params
      params.require(:prazo_locacao).permit(:descricao, :qtd_dias)
    end
end
