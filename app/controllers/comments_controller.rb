class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @nail = @comment.nail
    @comments = @nail.comments.includes(:user)
    if @comment.save
      redirect_to "/nails/#{@comment.nail.id}"
    else
      render "nails/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, nail_id: params[:nail_id])
  end
end
