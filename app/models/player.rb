class Player < ApplicationRecord
  belongs_to :user
  belongs_to :match
  validates :user_id, uniqueness: { scope: [:match_id, :status] }
end
