class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, ->{ where(read_at: nil).order("created_at DESC") }
  scope :recent, -> { limit(5).order("created_at DESC") }
end
