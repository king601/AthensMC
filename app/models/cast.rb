class Cast < ActiveRecord::Base
	validates :episode, presence: true, uniqueness: { case_sensitive: false }
	validates :releasedate, presence: true
	validates :description, presence: true
	validates :embedcode, presence: true

	belongs_to :user
end
