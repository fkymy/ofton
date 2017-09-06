class KpiManager
  def self.fetch_data
    data = {
      'AGGREGATE' => {},
      'MONTHLY' => {},
      '4WAGO' => {},
      '3WAGO' => {},
      '2WAGO' => {},
      'WEEKLY' => {},
      'DAILY' => {}
    }

    data.keys.each do |key|
      posts = posts(key)
      comments = comments(key)
      strange_posts = strange_posts(key)
      strange_comments = strange_comments(key)

      all_posts = posts.size
      all_comments = comments.size
      stranger_posts = strange_posts.size
      stranger_comments = strange_comments.size
      comments_per_post = (all_comments.to_f / all_posts).round(2)

      strangers = (strange_posts.pluck(:author) + strange_comments.pluck(:author)).uniq.size

      data[key]['all_posts'] = all_posts
      data[key]['stranger_posts'] = stranger_posts
      data[key]['all_comments'] = all_comments
      data[key]['stranger_comments'] = stranger_comments
      data[key]['comments_per_post'] = comments_per_post
      data[key]['strangers'] = strangers
    end

    data
  end

  def self.posts(period)
    posts = Post.all

    case period
    when 'AGGREGATE'
      posts
    when 'MONTHLY'
      posts.where(created_at: 30.days.ago..Time.now)
    when '4WAGO'
      posts.where(created_at: 4.weeks.ago..3.weeks.ago)
    when '3WAGO'
      posts.where(created_at: 3.weeks.ago..2.weeks.ago)
    when '2WAGO'
      posts.where(created_at: 2.weeks.ago..1.week.ago)
    when 'WEEKLY'
      posts.where(created_at: 7.days.ago..Time.now)
    when 'DAILY'
      posts.where(created_at: 24.hours.ago..Time.now)
    else
      0
    end
  end

  def self.comments(period)
    comments = Comment.all

    case period
    when 'AGGREGATE'
      comments
    when 'MONTHLY'
      comments.where(created_at: 30.days.ago..Time.now)
    when '4WAGO'
      comments.where(created_at: 4.weeks.ago..3.weeks.ago)
    when '3WAGO'
      comments.where(created_at: 3.weeks.ago..2.weeks.ago)
    when '2WAGO'
      comments.where(created_at: 2.weeks.ago..1.week.ago)
    when 'WEEKLY'
      comments.where(created_at: 7.days.ago..Time.now)
    when 'DAILY'
      comments.where(created_at: 24.hours.ago..Time.now)
    else
      0
    end
  end

  def self.strange_posts(period)
    stranger_posts = Post.where(generated_by: 'stranger')

    case period
    when 'AGGREGATE'
      stranger_posts
    when 'MONTHLY'
      stranger_posts.where(created_at: 30.days.ago..Time.now)
    when '4WAGO'
      stranger_posts.where(created_at: 4.weeks.ago..3.weeks.ago)
    when '3WAGO'
      stranger_posts.where(created_at: 3.weeks.ago..2.weeks.ago)
    when '2WAGO'
      stranger_posts.where(created_at: 2.weeks.ago..1.week.ago)
    when 'WEEKLY'
      stranger_posts.where(created_at: 7.days.ago..Time.now)
    when 'DAILY'
      stranger_posts.where(created_at: 24.hours.ago..Time.now)
    else
      0
    end
  end

  def self.strange_comments(period)
    stranger_comments = Comment.where(generated_by: 'stranger')

    case period
    when 'AGGREGATE'
      stranger_comments
    when 'MONTHLY'
      stranger_comments.where(created_at: 30.days.ago..Time.now)
    when '4WAGO'
      stranger_comments.where(created_at: 4.weeks.ago..3.weeks.ago)
    when '3WAGO'
      stranger_comments.where(created_at: 3.weeks.ago..2.weeks.ago)
    when '2WAGO'
      stranger_comments.where(created_at: 2.weeks.ago..1.week.ago)
    when 'WEEKLY'
      stranger_comments.where(created_at: 7.days.ago..Time.now)
    when 'DAILY'
      stranger_comments.where(created_at: 24.hours.ago..Time.now)
    else
      0
    end
  end
end
