class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize_request(kind = nil)
    unless kind.include?(current_user.role)
      redirect_to posts_path, notice: "No estás autorizado para realizar esta acción."
    end
  end


  protected

  def configure_permitted_parameters
    attributes = [:name, :email, :role]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

end

