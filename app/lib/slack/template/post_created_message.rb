module Slack
  module Template
    class PostCreatedMessage

      def initialize(post)
        @post = post
      end

      def self.format(post)
        self.new(post).format
      end

      # See: https://api.slack.com/docs/message-attachments
      def format
        {
          text: "*投稿がありました*",
          attachments: [
            {
              fallback: "Post created",
              color: '#fb9d6d',
              title: "Post ID: #{@post.id}",
              title_link: "http://ofton.club/posts/#{@post.id}",
              text: text,
              footer: "with love,",
              ts: Time.zone.now.to_i
            }
          ]
        }
      end

      private

      def text
        "author:\n#{@post.author}\n\nbody:\n#{@post.body}"
      end
    end
  end
end
