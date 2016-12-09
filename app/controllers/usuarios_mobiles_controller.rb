class UsuariosMobilesController < ApplicationController
  before_action :set_usuarios_mobile, only: [:show, :edit, :update, :destroy]

  # GET /usuarios_mobiles
  # GET /usuarios_mobiles.json
  def index
    @usuarios_mobiles = UsuariosMobile.all.order(:login)
  end

  # GET /usuarios_mobiles/1
  # GET /usuarios_mobiles/1.json
  def show
  end

  # GET /usuarios_mobiles/new
  def new
    @usuarios_mobile = UsuariosMobile.new
  end

  # GET /usuarios_mobiles/1/edit
  def edit
  end

  # POST /usuarios_mobiles
  # POST /usuarios_mobiles.json
  def create
    @usuarios_mobile = UsuariosMobile.new(usuarios_mobile_params)

    colaborador = Colaborador.find_by_id(params[:usuarios_mobile][:colaborador_id])

    @usuarios_mobile.colaborador = colaborador

    respond_to do |format|
      if @usuarios_mobile.save
        format.html { redirect_to @usuarios_mobile, notice: 'Usuarios mobile criado com sucesso.' }
        format.json { render :show, status: :created, location: @usuarios_mobile }
      else
        format.html { render :new }
        format.json { render json: @usuarios_mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios_mobiles/1
  # PATCH/PUT /usuarios_mobiles/1.json
  def update
    respond_to do |format|
      if @usuarios_mobile.update(usuarios_mobile_params)
        format.html { redirect_to @usuarios_mobile, notice: 'Usuarios mobile atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @usuarios_mobile }
      else
        format.html { render :edit }
        format.json { render json: @usuarios_mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios_mobiles/1
  # DELETE /usuarios_mobiles/1.json
  def destroy
    @usuarios_mobile.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_mobiles_url, notice: 'Usuarios mobile deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuarios_mobile
      @usuarios_mobile = UsuariosMobile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuarios_mobile_params
      params.require(:usuarios_mobile).permit(:login, :senha, :colaborador_id, :super_usuario)
    end
end
