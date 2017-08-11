class CommentsController < ApplicationController
  # decorates_assigned :comment

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    if @comment.save && Post.increment_counter(:comments_count, params[:post_id])
      Slack::CommentCreatedNotifier.notify(Slack::Template::CommentCreatedMessage.format(@comment))

      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :author, :body)
  end
end
