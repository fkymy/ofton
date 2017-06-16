class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validate :body, presence: true
  validate :comments_count, presence: true, numericality: { only_integer: true }

end
