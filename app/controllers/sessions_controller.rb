class SessionsController < ApplicationController

  def new
    # ログインフォームを表示するビューを返す
    #@user = User.new
  end

  def create
  end

  def destroy
    session[:users_id] = nil
    redirect_to root_path, notice: "ログアウトしました"
  end
end
