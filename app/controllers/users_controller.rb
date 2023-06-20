class UsersController < ApplicationController
    def index
        @users = User.new
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            #ユーザー登録成功時の処理
            redirect_to user_path, notice: "ユーザー登録が完了しました"
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end