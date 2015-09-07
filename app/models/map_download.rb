class MapDownload < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :link, presence: true
end
