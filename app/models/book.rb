class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_one_attached :photo
  validates :title, :description, :author, :year, :publisher, presence: true
end
