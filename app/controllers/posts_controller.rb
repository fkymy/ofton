class PostsController < ApplicationController
  # decorates_assigned :posts
  before_action :sign_in_user, only: [:new, :create]

  def index
    #@recents = Post.since(24.hours.ago).order_by_default
    #@posts = Post.all.joins(:comments).where.not(created_at: 24.hours.ago..Time.now).order_by_last_active_at.distinct.page(params[:page])
    @posts = Post.all.order_by_last_active_at.page(params[:page])
    # has_notif? true or false
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order("created_at asc")
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.body = helpers.simple_nkf(post_params[:body])
    @post.generated_by = admin_signed_in? ? 'admin' : 'user'

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
    params.require(:post).permit(:body)
  end

  def sign_in_user
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
