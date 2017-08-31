class PostsController < ApplicationController
  # decorates_assigned :posts

  def index
    @recents = Post.since(24.hours.ago).order_by_default
    @posts = Post.all.joins(:comments).where.not(created_at: 24.hours.ago..Time.now).order_by_last_active_at.distinct.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order("created_at asc")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    @post.author = helpers.simple_nkf(post_params[:author])
    @post.body = helpers.simple_nkf(post_params[:body])
    @post.generated_by = 'admin' if admin_signed_in?
    @post.last_active_at = Time.now

    if @post.save
      Slack::PostCreatedNotifier.notify(
        Slack::Template::PostCreatedMessage.format(@post)
      ) unless admin_signed_in?

      redirect_to @post
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:author, :body)
  end
end
