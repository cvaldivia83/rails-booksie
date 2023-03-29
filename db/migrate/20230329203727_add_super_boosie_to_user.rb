class AddSuperBoosieToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :super_booksie, :boolean, default: false
  end
end
