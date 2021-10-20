class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      message = "something went wrong, make sure your data are correct"
      redirect_to login_path, notice: message
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'logged out succefully'
  end
end
