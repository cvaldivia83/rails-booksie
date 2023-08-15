class User < ApplicationRecord
  has_many :wishlists, through: :list
  has_many :lists, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :books, through: :bookings
  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def address
    [address, city, country].compact.join(', ')
  end

end
