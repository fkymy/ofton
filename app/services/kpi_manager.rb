class KpiManager
  def self.curate_data
    # TODO: うんちこーどだけどまたすぐかわりそうなのでとりあえずこれで
    # Concerned Entities
    # # New Users
    new_users = User.all.where(created_at: 7.days.ago..Time.now).size

    # # Posts by New users
    posts = 0
    new_users.each do |new_user|
      posts += new_user.posts.where(created_at: 7.days.ago..Time.now).size
    end

    # # Unique CommentedPosts by new users
    comments = 0
    new_users.each do |new_user|
      #commented_posts instead
      if new_user.comments.where(created_at: 7.days.ago..Time.now).present?
        comments += 1
      end
    end

    # # Posts and CommentedPosts by New User
    actions = posts + comments

    # % Posts and CommentedPosts / # ""
    posts_ratio = posts / actions.to_f
    comments_ratio = commets / actions.to_f

    # # Posts and CommentedPosts with more than two contributers including the User
    mm = 0
    new_users.each do |new_user|
      posts = new_user.posts
      commented_posts = new_user.commented_posts

      if posts.presents?
        posts.each do |post|
          if post.commented_users >= 2 && post.comments.where(user_id: new_user.id).present?
            mm += 1
          end
        end
      end

      if commented_posts.present?
        commented_posts.each do |post|
          if post.commented_users >= 2 && post.comments.where(user_id: new_user.id).size >= 2
            mm += 1
          end
        end
      end
    end

    # Calculate size in periods
    data_to_curate.keys.each do |key|

      comments_per_post = all_posts == 0 ? 'NA' : (all_comments.to_f / all_posts).round(2)

      data_to_curate[key]['comments_per_post'] = comments_per_post
    end

    data_to_curate
  end

  def self.calculate_size(entity, time_period)
    size = case time_period
      when 'WEEKLY'
        entity.where(created_at: 7.days.ago..Time.now).size
      else
        nil
    end

    size
  end
end
