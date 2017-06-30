class PostDecorator < ApplicationDecorator
  delegate_all

  def author
    object.try(:author).presence || 'anonymous'
  end

  def avatar
    "https://api.adorable.io/avatars/75/#{object.id}"
  end
end
