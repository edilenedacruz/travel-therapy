class SessionsController < ApplicationController

  def new
  end

  def create_facebook
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:success] = "You are now logged in."
    redirect_to user_path(user)
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You are now logged in."
      redirect_to user_path(user)
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You are now logged out."
    redirect_to root_path
  end

end
