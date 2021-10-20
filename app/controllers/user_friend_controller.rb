class UserFriendController < ApplicationController
  def friend
      UserFriend.create(user_friend_params)
      redirect_to home_path, notice: 'friend added succefully'
  end

  def unfriend
      UserFriend.where(user_friend_params)
      .or(UserFriend.where(friend_id:user_friend_params[:user_id], user_id: user_friend_params[:friend_id]))
      .destroy_all
      redirect_to home_path, notice: 'friend removed succefully'
  end

  private
  def user_friend_params
    params.permit(:user_id, :friend_id)
  end

end
