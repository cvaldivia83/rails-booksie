class AddRatingToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :rating, :decimal, precision: 2, scale: 1
  end
end
