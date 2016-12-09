# encoding: utf-8
class BemColaboradoresController < ApplicationController
  before_action :set_bem_colaborador, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Bem_colaboradores", :bem_colaboradores_path
  add_breadcrumb "Detalhar", :bem_colaborador_path, only: [:show]
  add_breadcrumb "Incluir ", :new_bem_colaborador_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_bem_colaborador_path, only: [:edit, :update]

  respond_to :html
  def index
    # @bem_colaboradores = BemColaborador.all
    @bem_colaboradores_grid = initialize_grid(BemColaborador.all,
      order: :created_at,
      order_direction: 'asc',
      name: 'u1',
      csv_file_name: "bem_colaboradores_#{Time.now.strftime('%d%m%y%H%M%S')}")
  end

  def show

  end

  def new
    @bem_colaborador = BemColaborador.new
  end

  def edit
  end

  def create
    @bem_colaborador = BemColaborador.new(bem_colaborador_params)

    respond_to do |format|
      if @bem_colaborador.save
        format.html { redirect_to bem_colaboradores_url, notice: I18n.t("messages.cadastro_sucesso", :model => "Bem / Colaborador") }
        format.json { render :show, status: :created, location: @bem_colaborador }
      else
        format.html { render :new }
        format.json { render json: @bem_colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @bem_colaborador.update(bem_colaborador_params)
        redirect_to bem_colaboradores_url, notice: t('messages.atualizado_sucesso', :model => "Bem / Colaborador")
    else
      render :edit
    end
  end

  def destroy
    @bem_colaborador.destroy
    redirect_to bem_colaboradores_url, notice: t('messages.delecao_sucesso', :model => "Bem / Colaborador")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bem_colaborador
      @bem_colaborador = BemColaborador.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bem_colaborador_params
      params.require(:bem_colaborador).permit(:bem_id, :colaborador_id, :quantidade)
    end
end
