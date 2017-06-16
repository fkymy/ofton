class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validate :body, presence: true
  validate :comments_count, presence: true, numericality: { only_integer: true }

end

# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  author         :string
#  body           :text             not null
#  comment_count  :integer          default("0")
#
# Indexes
#
#
