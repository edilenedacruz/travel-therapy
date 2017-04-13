class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your account has been created."
      redirect_to "/#{@user.slug}"
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = User.find_by_slug(params[:slug])
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    if @user.save
      flash[:success] = "Your profile has been updated."
      redirect_to username_path
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :avatar, :email, :city, :state, :password, :password_confirmation, :slug)
  end
end
