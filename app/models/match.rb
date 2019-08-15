class Match < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user
  has_many :forums, dependent: :destroy
  has_many :players, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :date, :city, :location, :description, :time, :level, presence: true
  validates :number_of_players, numericality: { greater_than: 0 , even: true}

  include PgSearch
  pg_search_scope :search_by_game_details,
    against: [:location, :description, :level, :number_of_players, :city],
      using: { tsearch: { prefix: true } }

  def full?
    self.players.where.not(status: 'declined').count >= self.number_of_players
  end
end
