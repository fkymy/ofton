module Slack
  class CommentCreatedNotifier < Slack::BaseNotifier
    WEBHOOK_URL = ENV['SLACK_WEBHOOK_URL_OFTON']
    DEFAULT_OPTIONS = {
      username: 'chacha',
      icon_url: 'https://i2.wp.com/pleasure-bit.com/wp-content/uploads/2014/09/6845979aa9ab957214345621b8908e45.jpg?fit=300%2C236'
    }

  end
end
