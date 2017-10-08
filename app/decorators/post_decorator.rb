class PostDecorator < ApplicationDecorator
  delegate_all

  def author
    object.try(:author).presence || "#{object.user.username}さん"
  end

  def avatar
    "https://api.adorable.io/avatars/75/#{object.author}"
  end

  def truncated_body
    if object.body.size > 15
      "「#{object.body.to_s[0..15]}...」"
    else
      "「#{object.body}...」"
    end
  end

  def datetime
    if object.created_at > 1.week.ago
      "#{h.time_ago_in_words(object.created_at)}前"
    else
      object.created_at.strftime('%Y年%m月%d日 %H:%M')
    end
  end

  def last_active_at
    # set to updated_at, as comment touches post
    if object.updated_at > 1.week.ago
      "#{h.time_ago_in_words(object.updated_at)}前"
    else
      object.updated_at.strftime('%Y年%m月%d日 %H:%M')
    end
  end
end
