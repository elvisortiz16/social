class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to home_path
  end

  private
  def comment_params
    params.require(:comment).permit(:detail, :post_id).merge(user: current_user)
  end
end
