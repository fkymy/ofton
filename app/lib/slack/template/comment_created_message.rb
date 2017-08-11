module Slack
  module Template
    class CommentCreatedMessage

      def initialize(comment)
        @comment = comment
      end

      def self.format(comment)
        self.new(comment).format
      end

      # See: https://api.slack.com/docs/message-attachments
      def format
        {
          text: "*コメントが追加されました*",
          attachments: [
            {
              fallback: "Comment created",
              color: '#666',
              title: "Post ID: #{@comment.post.id}",
              title_link: "http://ofton.club/posts/#{@comment.post.id}",
              text: text,
              footer: "with love,",
              ts: Time.zone.now.to_i
            }
          ]
        }
      end

      private

      def text
        "author:\n#{@comment.author}\n\nbody:\n#{@comment.body}"
      end
    end
  end
end
