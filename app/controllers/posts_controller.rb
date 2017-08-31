class PostsController < ApplicationController
  # decorates_assigned :posts

  def index
    @recents = Post.since(24.hours.ago)
    @posts = Post.all.joins(:comments).where.not(created_at: 24.hours.ago..Time.now).order('comments.last.created_at desc').page(params[:page])
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
