class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(email: params[:email], password: params[:password])
          if @user
            session[:user_id] = @user.id
            flash[:notice] = "ログインに成功しました。"
            redirect_to root_path
        else
            flash[:alert] = "ログインに失敗しました。"
            render :new

        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "ログアウトしました"
    end

end
