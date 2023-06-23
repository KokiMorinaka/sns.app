class UsersController < ApplicationController
    def index
    end

    before_action :authenticate_user! # ユーザーがログインしているか確認するためのフィルタ

    def show
    @user = current_user # 現在ログインしているユーザーを取得
    end
end
