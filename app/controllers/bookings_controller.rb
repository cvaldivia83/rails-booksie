class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @book = Book.find(params[:book_id])
    @booking = Booking.new
    authorize @booking
  end
end
