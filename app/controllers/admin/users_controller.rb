# encoding: utf-8
class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html
  def index
    # @users = User.all
    @users_grid = initialize_grid(User.order(:nome),
      conditions: ['deleted_at is null'],
      order: 'id',
      name: 'u1',
      :csv_file_name => "usuarios_#{Time.now.strftime('%d%m%y%H%M%S')}")

    export_grid_if_requested('u1' => 'grid')
  end

  def show
  end

  def new
    @user = User.new
    authorize! :create, @user
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.password = Constants::PASSWD_DEFAULT
    @user.password_confirmation = Constants::PASSWD_DEFAULT

    if @user.save
      redirect_to admin_users_path, notice: t('messages.cadastro_sucesso', :model => "User")
    else
      render :new
    end
  end

  def update

    if @user.update(user_params)

        redirect_to admin_users_path, notice: t('messages.atualizado_sucesso', :model => "User")
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: t('messages.delecao_sucesso', :model => "User")
  end

  def redefinir_senha
    @user = User.find(params[:user_id])
    @user.reset_password( Constants::PASSWD_DEFAULT, Constants::PASSWD_DEFAULT )
    redirect_to :back, notice: 'Senha redefinida com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params[:user].permit(:nome, :login, :email, :password, :password_confirmation)
    end
end
