class Book < ApplicationRecord
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_in_books,
    against: %i[ title description year author publisher isbn ],
    using: {
      tsearch: { prefix: true }
    }
end
