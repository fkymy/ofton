class CommentDecorator < ApplicationDecorator
  delegate_all

  def author
    object.try(:author).presence || "#{object.user.username}さん"
  end

  def avatar
    "https://api.adorable.io/avatars/75/#{object.author}"
  end

  def datetime
    if object.created_at > 1.week.ago
      "#{h.time_ago_in_words(object.created_at)}前"
    else
      object.updated_at.strftime('%Y年%m月%d日 %H:%M')
    end
  end
end
