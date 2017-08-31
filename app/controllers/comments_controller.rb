class CommentsController < ApplicationController
  # decorates_assigned :comment

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    @comment.author = helpers.simple_nkf(comment_params[:author])
    @comment.body = helpers.simple_nkf(comment_params[:body])
    @comment.generated_by = 'admin' if admin_signed_in?

    @comment.post.last_active_at = Time.now
    @comment.post.comments_count += 1

    if @comment.save && @comment.post.save
      Slack::CommentCreatedNotifier.notify(Slack::Template::CommentCreatedMessage.format(@comment)) unless admin_signed_in?

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
