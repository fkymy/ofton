class Comment < ApplicationRecord
  belongs_to :post

  validate :body, presence: true
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
