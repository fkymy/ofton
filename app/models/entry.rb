class Entry < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :body, presence: true
end
