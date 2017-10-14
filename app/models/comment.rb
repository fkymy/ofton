class Comment < ApplicationRecord
  belongs_to :post, touch: true
  belongs_to :user, touch: true

  # has_enumeration_for :generated_by, with: CommentGeneratedBy, create_helpers: { prefix: true }

  validates :user_id, presence: true
  validates :body, presence: true

  # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # with parameters as value or custom methods defined in your model as lambda or symbol.
  # The first argument is the plural symbol name of your target model.
  acts_as_notifiable :users,
    # Notification targets as :targets is a necessary option
    # Set to notify to author and users commented to the article, except comment owner self
    targets: ->(comment, key) {
      ([comment.post.user] + comment.post.commented_users.to_a - [comment.user]).uniq
    },
    # Path to move when the notification is opened by the target user
    # This is an optional configuration since activity_notification uses polymorphic_path as default
    notifiable_path: :post_notifiable_path

  def post_notifiable_path
    post_path(post)
  end
end

# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  post_id        :bigint           not null
#  author         :string
#  body           :text             not null
#
# Indexes
#
#  index_comments_on_post_id        (post_id)
