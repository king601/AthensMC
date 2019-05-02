# ForumCategory
class ForumCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :sorted, -> { order(name: :asc) }
end
