class AddListToWishlist < ActiveRecord::Migration[7.0]
  def change
    add_reference :wishlists, :list, null: false, foreign_key: true
    remove_reference :wishlists, :user, index: true, foreign_key: true
  end
end
