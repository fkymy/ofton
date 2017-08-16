class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  has_enumeration_for :generated_by, with: PostGeneratedBy, create_helpers: { prefix: true }

  validates :body, presence: true
  validates :comments_count, presence: true, numericality: { only_integer: true }

  scope :order_by_default, -> {
    order(id: :desc)
  }

end

# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  author         :string
#  body           :text             not null
#  comments_count :integer          default("0")
#  generated_by   :integer          default("0")
#
# Indexes
#
#
