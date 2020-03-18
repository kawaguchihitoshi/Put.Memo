class ApplicationController < ActionController::Base
  before_action :set_search
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_search
    @search = Message.ransack(params[:q])
    @message = @search.result
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
