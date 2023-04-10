class WishlistsController < ApplicationController

  def index
    @wishlists = policy_scope(Wishlist)
  end

  def new
    @wishlist = Wishlist.new
    authorize @wishlist
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.user = current_user
    @wishlist.save!
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:book)
  end
end
