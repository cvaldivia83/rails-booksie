class AddNameToWishlist < ActiveRecord::Migration[7.0]
  def change
    add_column :wishlists, :name, :string
  end
end
