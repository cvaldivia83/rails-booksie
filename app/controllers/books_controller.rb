class BooksController < ApplicationController
  before_action :set_book, only: %i[show]

  def index
    @books = policy_scope(Book)
  end

  def show
    authorize @book
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
