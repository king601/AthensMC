# ForumThread
class ForumThread < ApplicationRecord
  searchkick callbacks: :async
  scope :search_import, -> { includes(:forum_posts) }

  extend FriendlyId
  friendly_id :subject, use: :slugged

  belongs_to :user

  has_many :forum_posts, -> { order(:created_at => :ASC) }, dependent: :destroy

  # forum_thread.users
  has_many :users, through: :forum_posts

  accepts_nested_attributes_for :forum_posts

  validates :subject, presence: true
  validates_associated :forum_posts

  def search_data
    attributes.merge(
      subject: subject,
      forum_posts: forum_posts
     )
  end
end
