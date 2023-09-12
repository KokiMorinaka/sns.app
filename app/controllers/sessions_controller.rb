class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(email: params[:email]) 
        if@user&.authenticate(params[:password])
            #ログイン成功した場合
            session[:user_id] = @user.id
            flash[:notice] = "ログインに成功しました。"
            redirect_to new_post_path
            #ログイン失敗した場合
        else
            flash[:alert] = "メールアドレスまたはパスワードが正しくありません。"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "ログアウトしました"
    end

end
