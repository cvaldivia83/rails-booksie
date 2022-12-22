class BooksController < ApplicationController
  def index
    @books = policy_scope(Book)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :year, :publisher, :author, :photo)
  end
end
