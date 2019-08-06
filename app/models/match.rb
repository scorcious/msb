class Match < ApplicationRecord
  belongs_to :user
  has_many :forums
  mount_uploader :photo, PhotoUploader
  validates :date, :location, :description, :time, :level, :number_of_players, :photo, presence: true
end
