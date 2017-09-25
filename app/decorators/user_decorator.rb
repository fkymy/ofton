class UserDecorator < ApplicationDecorator
  delegate_all

  def username
    "#{object.username}さん"
  end

  def avatar
    "animals/#{object.avatar}-square.svg"
  end
end
