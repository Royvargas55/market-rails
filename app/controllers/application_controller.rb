class ApplicationController < ActionController::Base
    include SessionsHelper
    
    private
    def require_user
      unless logged_in?
        flash[:info] = "Debes ingresar para poder hacerlo"
        redirect_to root_path
      end
    end
end
