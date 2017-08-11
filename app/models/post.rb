class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :body, presence: true
  validates :comments_count, presence: true, numericality: { only_integer: true }

  scope :order_by_default, -> {
    order(id: :desc)
  }

  enum generate_by: {
    admin: 0,
    stranger: 1,
    user: 2
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
