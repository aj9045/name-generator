class SessionController < ApplicationController
  def new
    render :login
  end

  def login
    @user = User.find_by(username: user_params[:username])
    if @user.password == user_params[:password]
      session[:user_id] = @user.id
    else
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end