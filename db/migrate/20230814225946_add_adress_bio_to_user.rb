class AddAdressBioToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
