class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_book, only: %i[show]

  def index
    if params[:query].present?
      @books = policy_scope(Book).search_in_books(params[:query])
    else
      @books = policy_scope(Book)
    end
  end

  def show
    authorize @book
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
