class Wishlist < ApplicationRecord
  belongs_to :list
  belongs_to :book

  validates :book_id, uniqueness: { scope: :list_id, message: "Book is already in this list" }
end
