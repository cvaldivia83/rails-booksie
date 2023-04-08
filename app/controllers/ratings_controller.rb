class RatingsController < ApplicationController
  before_action :set_book, only: [:create]
  def create
    @rating = Rating.new(rating_params)
    @rating.book = @book
    authorize @rating
    @rating.save
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def rating_params
    params.require(:rating).permit(:rating)
  end
end
