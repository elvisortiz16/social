class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      render :new
    end
  end

  def update
    User.find(params[:id]).update(user_params)
    redirect_to home_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, profile_attributes: {})
  end

end
