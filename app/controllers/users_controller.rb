class UsersController < ApplicationController
    before_action :set_user, only: [:update, :edit, :show]

    def new
        @user = User.new
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 2)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to the blog, #{@user.username}"
            redirect_to articles_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:success] = "Updated successfully"
            redirect_to articles_path
        else
            render :edit
        end
    end

    def show
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end
end