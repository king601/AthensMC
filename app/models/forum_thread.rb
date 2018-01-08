# ForumThread
class ForumThread < ApplicationRecord
  include Paginatable
  extend FriendlyId

  searchkick callbacks: :async
  friendly_id :subject, use: :slugged

  belongs_to :forum_category, required: true
  belongs_to :user, required: true

  has_many :forum_posts, -> { order(:created_at => :ASC) }, dependent: :destroy, autosave: true

  # forum_thread.users
  has_many :users, through: :forum_posts

  accepts_nested_attributes_for :forum_posts

  validates :subject, presence: true
  validates_associated :forum_posts, presence: true

  scope :search_import, -> { includes(:forum_posts, :forum_category) }

  def search_data
    {
      subject: subject,
      slug: slug,
      forum_posts: forum_posts,
      sticky: sticky,
      last_post_created_at: last_post_created_at,
      forum_category_id: forum_category.id
    }
  end
end
