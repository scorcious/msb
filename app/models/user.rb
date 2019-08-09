class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :forums, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :name, :city, presence: true
  has_friendship
end
