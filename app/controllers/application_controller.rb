class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :authorize!

  # before_action :authorize!

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def authorize!
  #   unless current_user
  #     flash[:danger] = "You are not authorized to visit this page!"
  #     redirect_to root_path
  #   end
  # end

end
