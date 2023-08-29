class UsersController < ApplicationController
    #def index
    #@user = current_user # 現在ログインしているユーザーを取得
    #end

    def new
      @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          #ユーザーが保存された後、画像をアップロードする
          if params[:users][:image_name].present?
            @user.update(image_name: params[:users][:image_name])
            #session[:user_id] = @user.id
        end
            redirect_to root_path, notice: "ユーザー登録が完了しました"
        else
            flash.now[:alert] = "ユーザー登録に失敗しました"
            render :new
        end
    end

    def show
      # ユーザー情報を取得する前に、リクエストがCSSファイルの取得リクエストであるかを確認
      if params[:id] == "styles"
        render plain: "", content_type: "text/css"
      else
        @user = current_user # ユーザー情報を取得
      end
  end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    #def show
    #@user = current_user # 現在ログインしているユーザーを取得
    #end
    #before_action :authenticate_user! # ユーザーがログインしているか確認するためのフィルタ
end
