class List < ApplicationRecord
  belongs_to :user
  has_many :wishlists, dependent: :destroy
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
end
