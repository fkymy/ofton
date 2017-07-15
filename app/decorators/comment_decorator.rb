class CommentDecorator < ApplicationDecorator
  delegate_all

  def author
    object.try(:author).presence || 'anonymous'
  end

  def avatar
    "https://api.adorable.io/avatars/75/#{object.id}"
  end

  def datetime
    if object.created_at > 1.week.ago
      "#{h.time_ago_in_words(object.created_at)}前"
    else
      l(object.created_at, format: :long)
    end
  end
end
