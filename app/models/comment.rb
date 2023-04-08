class Comment < ApplicationRecord
  validates :content, length: { minimum: 15 }
  belongs_to :user
  belongs_to :post
end
