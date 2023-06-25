class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def after_sign_out_path_for(resource_or_scope)
    # ログアウト後のリダイレクト先を指定
    "http://localhost:3000/users/sign_in"
    #authenticated_posts_path
  end
end