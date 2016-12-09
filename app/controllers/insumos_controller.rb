# encoding: utf-8
class InsumosController < ApplicationController
  before_action :set_insumo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Insumos", :insumos_path
  add_breadcrumb "Detalhar", :insumo_path, only: [:show]
  add_breadcrumb "Incluir ", :new_insumo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_insumo_path, only: [:edit, :update]

  respond_to :html
  def index
    @insumos = Insumo.all
    @insumos_grid = initialize_grid(Insumo.all.order(:descricao),
      order: :created_at,
      order_direction: 'asc',
      name: 'u1',
      csv_file_name: "insumos_#{Time.now.strftime('%d%m%y%H%M%S')}")
  end

  def show

  end

  def new
    @insumo = Insumo.new
  end

  def edit
  end

  def create
    @insumo = Insumo.new(insumo_params)

    respond_to do |format|
      if @insumo.save
        format.html { redirect_to insumos_url, notice: I18n.t("messages.cadastro_sucesso", :model => "Insumo") }
        format.json { render :show, status: :created, location: @insumo }
      else
        format.html { render :new }
        format.json { render json: @insumo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @insumo.update(insumo_params)
        redirect_to insumos_url, notice: t('messages.atualizado_sucesso', :model => "Insumo")
    else
      render :edit
    end
  end

  def destroy
    @insumo.destroy
    redirect_to insumos_url, notice: t('messages.delecao_sucesso', :model => "Insumo")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insumo
      @insumo = Insumo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def insumo_params
      params.require(:insumo).permit(:descricao, :grupo_insumo_id)
    end
end
