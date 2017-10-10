class PostsController < ApplicationController
  # decorates_assigned :posts
  before_action :sign_in_user, only: [:new, :create]

  def index
    @posts = Post.all.order_by_last_active_at.includes(:user).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order("created_at asc").includes(:user)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.body = helpers.simple_nkf(post_params[:body])

    if @post.save
      # Slack::PostCreatedNotifier.notify(
      #   Slack::Template::PostCreatedMessage.format(@post)
      # ) unless admin_signed_in?

      redirect_to @post
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def sign_in_user
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
