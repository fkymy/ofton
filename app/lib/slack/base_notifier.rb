module Slack
  class BaseNotifier
    include Singleton

    def initialize
      webhook_url = self.class::WEBHOOK_URL
      options = self.class::DEFAULT_OPTIONS

      @_notifier = Slack::Notifier.new(webhook_url, options)
    end

    def self.notify(message, options = {})
      instance.notify(message, options)
    end

    # raise an HTTP error if the response is not 2xx(success).
    def self.notify!(message, options = {})
      nofiy(message.options).value
    end

    # See: https://github.com/stevenosloan/slack-notifier
    def notify(message, options = {})
      @_notifier.ping(message, options)
    end
  end
end
