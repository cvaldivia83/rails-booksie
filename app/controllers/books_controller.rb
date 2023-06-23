class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_book, only: %i[show]

  def index
    @books = policy_scope(Book)
    if params[:query].present?
      @books = policy_scope(Book).search_in_books(params[:query])
    end

      respond_to do |format|
        format.html
        format.text { render partial: 'books/list', locals: { books: @books }, formats: [:html] }
      end
  end

  def show
    authorize @book
    @rating = Rating.new
    @wishlist = Wishlist.new
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
