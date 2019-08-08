class Match < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user
  has_many :forums
  has_many :players
  mount_uploader :photo, PhotoUploader
  validates :date, :city, :location, :description, :time, :level, presence: true
  validates :number_of_players, numericality: { greater_than: 0 , even: true}

  def full?
    self.players.count >= self.number_of_players
  end
end
