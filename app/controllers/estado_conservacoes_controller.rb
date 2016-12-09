# encoding: utf-8
class EstadoConservacoesController < ApplicationController
  before_action :set_estado_conservacao, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Estado_conservacoes", :estado_conservacoes_path
  add_breadcrumb "Detalhar", :estado_conservacao_path, only: [:show]
  add_breadcrumb "Incluir ", :new_estado_conservacao_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_estado_conservacao_path, only: [:edit, :update]

  respond_to :html
  def index
    @estado_conservacoes = EstadoConservacao.all
    @estado_conservacoes_grid = initialize_grid(EstadoConservacao.all.order(:descricao),
      order: :created_at,
      order_direction: 'asc',
      name: 'u1',
      csv_file_name: "estado_conservacoes_#{Time.now.strftime('%d%m%y%H%M%S')}")
  end

  def show

  end

  def new
    @estado_conservacao = EstadoConservacao.new
  end

  def edit
  end

  def create
    @estado_conservacao = EstadoConservacao.new(estado_conservacao_params)

    respond_to do |format|
      if @estado_conservacao.save
        format.html { redirect_to estado_conservacoes_url, notice: I18n.t("messages.cadastro_sucesso", :model => "Estado_conservacao") }
        format.json { render :show, status: :created, location: @estado_conservacao }
      else
        format.html { render :new }
        format.json { render json: @estado_conservacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @estado_conservacao.update(estado_conservacao_params)
        redirect_to estado_conservacoes_url, notice: t('messages.atualizado_sucesso', :model => "Estado_conservacao")
    else
      render :edit
    end
  end

  def destroy
    @estado_conservacao.destroy
    redirect_to estado_conservacoes_url, notice: t('messages.delecao_sucesso', :model => "Estado_conservacao")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_conservacao
      @estado_conservacao = EstadoConservacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estado_conservacao_params
      params.require(:estado_conservacao).permit(:descricao)
    end
end
