class Revision < ActiveRecord::Base
	validates :title, presence: true,
						length: { minimum: 5 }
	validates :text, presence: true

	belongs_to :user
end
