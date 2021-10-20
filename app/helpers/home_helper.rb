module HomeHelper
  def get_friends
    User.joins(:profile).where.not(id:current_user.id, profiles: {name: nil}).map do |user|
      already_friend = UserFriend.where(user_id:current_user.id, friend_id: user.id)
                        .or(UserFriend.where(friend_id:current_user.id, user_id: user.id))
                        .present?
      {
        id: user.id,
        profile_name: user.profile.name,
        already_friend: already_friend
      }
    end.compact
  end
end
