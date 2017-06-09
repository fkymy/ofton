class Comment < ApplicationRecord
  belongs_to :entry, counter_cache: true
  validates :entry_id, presence: true
  validates :body, presence: true
end
