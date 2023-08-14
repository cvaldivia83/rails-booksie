class List < ApplicationRecord
  belongs_to :user
  has_many :wishlists, dependent: :destroy
  has_many :books, through: :wishlist
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :name, uniqueness: true
end
