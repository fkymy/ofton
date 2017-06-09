class Comment < ApplicationRecord
  belongs_to :entry, counter_cache: true
end
