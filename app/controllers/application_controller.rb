class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    include SessionsHelper
    
    private
    def require_user
      unless logged_in?
        flash[:info] = "Debes ingresar para poder hacerlo"
        redirect_to root_path
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
    end
  
    def after_sign_in_path_for(resource)
      root_path
    end
    
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
end
