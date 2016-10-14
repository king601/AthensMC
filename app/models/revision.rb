# Revision
class Revision < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :text, presence: true

  belongs_to :user
end
