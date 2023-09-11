class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :photo
  has_rich_text :rich_content
end
