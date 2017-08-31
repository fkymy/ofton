class PostDecorator < ApplicationDecorator
  delegate_all

  def author
    object.try(:author).presence || '匿名さん'
  end

  def avatar
    "https://api.adorable.io/avatars/75/#{object.author}"
  end

  def datetime
    if object.last_active_at > 1.week.ago
      "#{h.time_ago_in_words(object.created_at)}前"
    else
      l(object.last_active_at, format: :long)
    end
  end
end
