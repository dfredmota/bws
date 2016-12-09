class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include TheRole::Controller

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  # check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to root_path, :alert => 'Você não está autorizado para acessar esta página' if user_signed_in?
    flash[:alert] = 'Você não está autorizado para acessar esta página'
    render text: "<script>window.location = '#{root_path}';</script>", status: :unauthorized if user_signed_in?
  end
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    # def configure_permitted_parameters
    #   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password) }
    # end
end
