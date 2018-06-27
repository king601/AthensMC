class Message < ApplicationRecord
  belongs_to :conversation, counter_cache: true
  belongs_to :user, required: true

  validates :content, presence: true
end
