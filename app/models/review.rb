class Review < ApplicationRecord
  belongs_to :book
  validates :title, length: { minimum: 2 }
  validates :content, length: { minimum: 10 }
end
