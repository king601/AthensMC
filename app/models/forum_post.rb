# ForumPost
class ForumPost < ApplicationRecord
  belongs_to :forum_thread, counter_cache: true, touch: true, required: true
  belongs_to :user

  validates :body, presence: true

  # Displays the forum posts in the threads from oldest to newest.
  default_scope { order(created_at: :ASC) }
end
