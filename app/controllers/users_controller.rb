class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    before_action :admin_user,     only: :destroy

    def index
        @users = User.all#where(activated: true).all
    end

    # def show
    #     @user = User.find(params[:id])
    #     #redirect_to root_url and return unless @user.activated?
    # end

    def update
        if @user.update_attributes(user_params)
        flash[:info] = "Perfil editado"
        redirect_to @user
        else
        render 'edit'
        end
    end

    def destroy
        if @user.delete
        flash[:info] = "Usuario eliminado"
        redirect_to users_url
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :about)
    end

    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end

    def set_user
        @user = User.find_by(id: params[:id])
       # User.friendly.find_by(slug: params[:id]) ||
    end
end
