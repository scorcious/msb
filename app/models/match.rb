class Match < ApplicationRecord
  belongs_to :user
  has_many :forums
  has_many :players
  mount_uploader :photo, PhotoUploader
end
