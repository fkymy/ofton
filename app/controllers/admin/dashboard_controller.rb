class Admin::DashboardController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!

  def index
    # TODO: うんちこーどだけどまたすぐかわりそうなのでとりあえずこれで
    # Concerned Entities
    # # New Users
    new_users = User.all.where(created_at: 7.days.ago..Time.now)
    @new_users = new_users.size

    # # Posts by New users
    posts_a = []
    new_users.each do |new_user|
      posts = new_user.posts.pluck(:id)
      commented_posts = new_user.commented_posts.pluck(:id)
      posts_a = posts_a + posts + commented_posts
    end
    @all_posts = posts_a.size
    @uniq_posts = posts_a.uniq.size

    # # CommentedPosts by new users
    @comments = @all_posts - @uniq_posts

    # % Posts and CommentedPosts / # ""
    @posts_ratio = @uniq_posts / @all_posts.to_f
    @comments_ratio = @comments / @all_posts.to_f

    # # Posts and CommentedPosts with more than two contributers including the User
    mm_a = []
    new_users.each do |new_user|
      commented_posts = new_user.commented_posts
      if commented_posts.present?
        commented_posts.each do |post|
          if post.commented_users.size >= 2
            mm_a << post.id
          end
        end
      end
    end
    @mm = mm_a.uniq.size

    @today = Time.now.strftime('%Y年%m月%d日')
    @week_ago = 7.days.ago.strftime('%Y年%m月%d日')
    # @data = KpiManager.curate_data
  end
end
