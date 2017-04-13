class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  # before_action :authorize!

  add_flash_types :success, :info, :warning, :danger

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def authorize!
  #   unless authorized?
  #     redirect_to root_url, danger: "You are not authorized to visit this page!"
  #   end
  # end
  #
  # def authorized?
  #
  # end

end
