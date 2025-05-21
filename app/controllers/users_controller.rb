class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            redirect_to user_path user
        else
            render :new
        end
    end

    def edit
    end

    def update
        user = User.update(user_params)

        if user.save
            redirect_to user_path user
        else
            render :edit
        end
    end

    def destroy
        @user = User.destroy
        redirect_to root_path
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
    end
end
