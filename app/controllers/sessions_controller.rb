class SessionsController < ApplicationController

  def new
  end

  def create_facebook
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to "/#{user.slug}"
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to "/#{@user.slug}"
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end

end
