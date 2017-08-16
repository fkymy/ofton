class Comment < ApplicationRecord
  belongs_to :post

  has_enumeration_for :generated_by, with: CommentGeneratedBy, create_helpers: { prefix: true }

  validates :body, presence: true

end

# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  post_id        :bigint           not null
#  author         :string
#  body           :text             not null
#  generated_by   :integer          default("0")
#
# Indexes
#
#  index_comments_on_post_id        (post_id)
