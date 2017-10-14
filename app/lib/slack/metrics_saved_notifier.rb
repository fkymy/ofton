module Slack
  class MetricsSavedNotifier < Slack::BaseNotifier
    WEBHOOK_URL = ENV['SLACK_WEBHOOK_URL_OFTON_KPI']
    DEFAULT_OPTIONS = {
      username: 'KPIマスター'
    }

  end
end
