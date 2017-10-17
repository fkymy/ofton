class Admin::DashboardController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!
  before_action :set_metrics, only: [:index, :save_metrics]

  def index
    # @data = KpiManager.curate_data
  end

  def save_metrics
    @metric = Metric.new
    @metric.allu = @all_users
    @metric.mau = @monthly_active_users
    @metric.wau = @weekly_active_users
    @metric.biau = @bi_active_users
    @metric.dau = @daily_active_users
    @metric.weekly_new_users = @new_users
    @metric.weekly_new_all_posts = @all_posts
    @metric.weekly_new_uniq_posts = @uniq_posts
    @metric.weekly_new_all_comments = @comments
    @metric.weekly_new_posts_ratio = @posts_ratio.round(2)
    @metric.weekly_new_comments_ratio = @comments_ratio.round(2)
    @metric.weekly_new_all_conv = @mm
    @metric.weekly_new_uniq_conv = @uniq_mm

    if @metric.save
      Slack::MetricsSavedNotifier.notify(
        Slack::Template::MetricsSavedMessage.format(@metric)
      )

      redirect_to admin_root_path
    else
      redirect_to admin_root_path
    end
  end

  private
  def set_metrics
    # TODO: うんちこーどだけどまたすぐかわりそうなのでとりあえずこれで
    # Concerned Entities
    # # Active Users
    @all_users = User.all.size
    @monthly_active_users = User.all.where(updated_at: 30.days.ago..Time.now).size
    @weekly_active_users = User.all.where(updated_at: 7.days.ago..Time.now).size
    @bi_active_users = User.all.where(updated_at: 3.days.ago..Time.now).size
    @daily_active_users = User.all.where(updated_at: 1.days.ago..Time.now).size

    # # New Users
    new_users = User.all.where(created_at: 7.days.ago..Time.now)
    @new_users = new_users.size

    # # Posts by New users
    posts_a = []
    r_posts_a = []
    r_comments_a = []
    new_users.each do |new_user|
      posts = new_user.posts.pluck(:id)
      commented_posts = new_user.commented_posts.pluck(:id)

      # for ratio
      r_posts_a = r_posts_a + posts
      r_comments_a = r_comments_a + commented_posts

      actions = posts + commented_posts
      posts_a = posts_a + actions.uniq
    end
    @all_posts = posts_a.size
    @uniq_posts = posts_a.uniq.size

    # # CommentedPosts by new users
    @comments = r_comments_a.size

    # % Posts and CommentedPosts / # ""
    r_all = r_posts_a.size + r_comments_a.size
    @posts_ratio = r_all == 0 ? 0 : r_posts_a.size / r_all.to_f
    @comments_ratio = r_all == 0 ? 0 : r_comments_a.size / r_all.to_f

    # # Posts and CommentedPosts with more than two contributers including the User
    mm_a = []
    new_users.each do |new_user|
      user_convs = []
      commented_posts = new_user.commented_posts
      if commented_posts.present?
        commented_posts.each do |post|
          if post.commented_users.size >= 2
            user_convs << post.id
          end
        end
      end
      mm_a = mm_a + user_convs.uniq
    end
    @mm = mm_a.size
    @uniq_mm = mm_a.uniq.size

    @today = Time.now.strftime('%Y年%m月%d日')
    @week_ago = 7.days.ago.strftime('%Y年%m月%d日')
  end
end
