class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @book = Book.find(params[:book_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @book = Book.find(params[:book_id])
    @wishlist = Wishlist.new
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user), notice: "Book was successfully booked." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :book_id)
  end
end
