# encoding: utf-8
class GrupoInsumosController < ApplicationController
  before_action :set_grupo_insumo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Grupo_insumos", :grupo_insumos_path
  add_breadcrumb "Detalhar", :grupo_insumo_path, only: [:show]
  add_breadcrumb "Incluir ", :new_grupo_insumo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_grupo_insumo_path, only: [:edit, :update]

  respond_to :html
  def index
    @grupo_insumos = GrupoInsumo.all
    @grupo_insumos_grid = initialize_grid(GrupoInsumo.all.order(:descricao),
      order: :created_at,
      order_direction: 'asc',
      name: 'u1',
      csv_file_name: "grupo_insumos_#{Time.now.strftime('%d%m%y%H%M%S')}")
  end

  def show

  end

  def new
    @grupo_insumo = GrupoInsumo.new
  end

  def edit
  end

  def create
    @grupo_insumo = GrupoInsumo.new(grupo_insumo_params)

    respond_to do |format|
      if @grupo_insumo.save
        format.html { redirect_to grupo_insumos_url, notice: I18n.t("messages.cadastro_sucesso", :model => "Grupo Insumo") }
        format.json { render :show, status: :created, location: @grupo_insumo }
      else
        format.html { render :new }
        format.json { render json: @grupo_insumo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @grupo_insumo.update(grupo_insumo_params)
        redirect_to grupo_insumos_url, notice: t('messages.atualizado_sucesso', :model => "Grupo Insumo")
    else
      render :edit
    end
  end

  def destroy
    @grupo_insumo.destroy
    redirect_to grupo_insumos_url, notice: t('messages.delecao_sucesso', :model => "Grupo Insumo")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo_insumo
      @grupo_insumo = GrupoInsumo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grupo_insumo_params
      params.require(:grupo_insumo).permit(:descricao)
    end
end
