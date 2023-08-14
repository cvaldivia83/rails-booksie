class WishlistsController < ApplicationController

  def index
    @wishlists = policy_scope(Wishlist)
  end

  def show
    @wishlist = Wishlist.find(params[:id])
    authorize @wishlist
  end

  def new
    @wishlist = Wishlist.new
    authorize @wishlist
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    authorize @wishlist
    if @wishlist.save
      redirect_to @wishlist.list
    else
      render 'books/show', status: :unprocessable_entity
    end
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    authorize @wishlist
    @wishlist.destroy
    redirect_to @wishlist.list
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:book_id, :list_id)
  end
end
