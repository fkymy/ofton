module Slack
  module Template
    class MetricsSavedMessage

      def initialize(metric)
        @metric = metric
      end

      def self.format(metric)
        self.new(metric).format
      end

      # See: https://api.slack.com/docs/message-attachments
      def format
        {
          text: "*#{Time.now.strftime('%Y年%m月%d日')}*",
          attachments: [
            {
              fallback: "Metrics Saved",
              color: '#ff0000',
              title: "KPIを保存しました．",
              title_link: "http://ofton.club/admin",
              text: text,
              footer: "年末までにWAU100人だ",
              ts: Time.zone.now.to_i
            }
          ]
        }
      end

      private

      def text
        text = "[MAU] #{@metric.mau}人 [WAU] #{@metric.wau}人 [BiAU] #{@metric.biau}人\n\n"\
               "--- 週次新規ユーザー ---\n"\
               "[訪問数] GAを見てくれ\n"\
               "[登録数] #{@metric.weekly_new_users}\n"\
               "[アクション数] #{@metric.weekly_new_all_posts}\n"\
               "[マジモメ数] #{@metric.weekly_new_all_conv}\n\n"\
               "--- 週次新規ユーザーファネル ---\n"\
               "[登録数 / 訪問数] GAを見てくれ\n"\
               "[アクション数 / 登録数] #{@metric.weekly_new_users == 0 ? 'NA' : ((@metric.weekly_new_all_posts / @metric.weekly_new_users.to_f) * 100).round(2)}%\n"\
               "[マジモメ数 / アクション数] #{@metric.weekly_new_all_posts == 0 ? 'NA' : ((@metric.weekly_new_all_conv / @metric.weekly_new_all_posts.to_f) * 100).round(2)}%\n"\
      end
    end
  end
end
