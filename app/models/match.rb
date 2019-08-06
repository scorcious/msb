class Match < ApplicationRecord
  belongs_to :user
  has_many :forums
  mount_uploader :photo, PhotoUploader
end
