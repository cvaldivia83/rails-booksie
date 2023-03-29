class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :year
      t.string :author
      t.string :publisher
      t.string :isbn
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
