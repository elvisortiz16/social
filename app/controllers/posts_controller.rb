class PostsController < ApplicationController
  def create
    Post.create(post_params)
    redirect_to home_path
  end

  private
  def post_params
    params.require(:post).permit(:detail).merge(user:current_user)
  end
end
