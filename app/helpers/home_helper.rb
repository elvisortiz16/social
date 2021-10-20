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
  def get_posts
     user_ids = UserFriend.where(user_id:current_user.id).map(&:friend_id)
     user_ids << UserFriend.where(friend_id:current_user.id).map(&:user_id)
     user_ids << current_user.id
     Post.where(user_id: user_ids.flatten).order(created_at: :desc)
  end
end
