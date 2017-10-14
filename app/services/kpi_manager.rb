class KpiManager
  def self.curate_data
    data_to_curate = {
      'AGGREGATE' => {},
      'MONTHLY' => {},
      '4WAGO' => {},
      '3WAGO' => {},
      '2WAGO' => {},
      'WEEKLY' => {},
      'DAILY' => {}
    }

    # Concerned Entities
    users = User.all
    posts = Post.all
    comments = Comment.all

    # Calculate size in periods
    data_to_curate.keys.each do |key|
      all_users = calculate_size(users, key)
      all_posts = calculate_size(posts, key)
      all_comments = calculate_size(comments, key)
      comments_per_post = all_posts == 0 ? 'NA' : (all_comments.to_f / all_posts).round(2)

      data_to_curate[key]['all_users'] = all_users
      data_to_curate[key]['all_posts'] = all_posts
      data_to_curate[key]['all_comments'] = all_comments
      data_to_curate[key]['comments_per_post'] = comments_per_post
    end

    data_to_curate
  end

  def self.calculate_size(entity, time_period)
    size = case time_period
      when 'AGGREGATE'
        size = entity.size
      when 'MONTHLY'
        entity.where(created_at: 30.days.ago..Time.now).size
      when '4WAGO'
        entity.where(created_at: 4.weeks.ago..3.weeks.ago).size
      when '3WAGO'
        entity.where(created_at: 3.weeks.ago..2.weeks.ago).size
      when '2WAGO'
        entity.where(created_at: 2.weeks.ago..1.week.ago).size
      when 'WEEKLY'
        entity.where(created_at: 7.days.ago..Time.now).size
      when 'DAILY'
        entity.where(created_at: 24.hours.ago..Time.now).size
      else
        nil
    end

    size
  end
end
