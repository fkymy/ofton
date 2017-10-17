class BulletinDecorator < ApplicationDecorator
  delegate_all

  def truncated_body
    if object.body.size > 20
      "「#{object.body.to_s[0..20]}...」"
    else
      "「#{object.body}...」"
    end
  end
end
