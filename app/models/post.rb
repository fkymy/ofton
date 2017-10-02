class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user
  belongs_to :user

  # has_enumeration_for :generated_by, with: PostGeneratedBy, create_helpers: { prefix: true }

  validates :user_id, presence: true
  validates :body, presence: true

  scope :order_by_default, -> {
    order(id: :desc)
  }

  scope :since, ->(time) {
    where("created_at > ?", time)
  }

  scope :order_by_last_active_at, -> {
    order(updated_at: :desc)
  }
end

# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  author         :string
#  body           :text             not null
#
# Indexes
#
#
