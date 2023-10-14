class PostsController < ApplicationController
    #before_action :set_post, only: [:edit, :update, :destroy]
    before_action :current_user, except: [:edit, :update, :destroy]
    #before_action :current_user
  
    def index
      @posts = Post.all
      #@records = Record.where("date_column <= ?", Date.today) # 今日までのデータを取得
    end

    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
  
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to posts_path
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      redirect_to posts_path
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :content, :recruitment_number, :deadline)
    end

    def current_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      else
        redirect_to new_session_path
    end
  end
  end