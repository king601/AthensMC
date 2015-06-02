class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :username, format: {message: "can only contain letters, numbers or underscores", with: /\A[a-zA-Z0-9]+\z/ }

  validates :minecraft_uuid, presence: true, uniqueness: { case_sensitive: false }

  has_many :revisions
  has_many :casts
end

