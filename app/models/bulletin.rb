class Bulletin < ApplicationRecord

  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true

  # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # with parameters as value or custom methods defined in your model as lambda or symbol.
  # The first argument is the plural symbol name of your target model.
  acts_as_notifiable :users,
    # Notification targets as :targets is a necessary option
    # Set to notify to author and users commented to the article, except comment owner self
    targets: ->(bulletin, key) {
      [User.find_by(id: bulletin.user_id)]
    }
end

# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  body           :text             not null
#  user_id        :integer
#
# Indexes
#
