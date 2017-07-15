class PostsController < ApplicationController
  # decorates_assigned :posts

  def index
    @posts = Post.all.order_by_default.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      Slack::PostCreatedNotifier.notify(Slack::Template::PostCreatedMessage.format(@post))

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
