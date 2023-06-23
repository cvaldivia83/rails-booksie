class User < ApplicationRecord
  has_many :wishlists, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :books, through: :bookings
  has_many :books, through: :wishlist
  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :photo
end
