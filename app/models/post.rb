class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :photo
  has_rich_text :rich_content
  has_many :likes, as: :likeable
  validates :title, presence: true, uniqueness: true
end
