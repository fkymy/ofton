class Comment < ApplicationRecord
  belongs_to :post

  validate :body, presence: true
end
