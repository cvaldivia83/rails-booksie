class User < ApplicationRecord
  has_many :wishlists, through: :list
  has_many :lists, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :books, through: :bookings
  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :friendships_as_asker, class_name: "Friendship", foreign_key: :asker_id
  has_many :friendships_as_receiver, class_name: "Friendship", foreign_key: :receiver_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :photo

  geocoded_by :get_address
  after_validation :geocode, if: :will_save_change_to_address?

  def get_address
    [address, city, country].compact.join(', ')
  end
end
