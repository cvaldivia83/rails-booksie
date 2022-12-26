require "json"
require "open-uri"

puts "Destroying all books and users from DB"

User.destroy_all
Book.destroy_all

# Retrieve a specific volume from Google's Book API
book_ids = ['EezJAwAAQBAJ', 'vU-FAAAAQBAJ', 'ss4RngEACAAJ', 'hHCKDwAAQBAJ', '7cibSgAACAAJ']

google_api= ENV["GOOGLE_BOOK_API"]

puts "Starting to seed user"

user = User.new(email: "valdivia.carla@gmail.com", password: 123456, username: 'queen_c')

portrait = URI.open("https://newprofilepic2.photo-cdn.net//assets/images/article/profile.webp")

user.photo.attach(io: portrait, filename: "carla.jpg", content_type: "image/webp")

user.save!

puts "Seeded 1 User!"

puts "Starting to seed books"

book_ids.each_with_index do |book, index|
  url = "https://www.googleapis.com/books/v1/volumes/#{book}?key=#{google_api}"
  book_serialized = URI.open(url).read
  book = JSON.parse(book_serialized)
  new_book = Book.new(title: book["volumeInfo"]["title"], description: book["volumeInfo"]["description"], year: book["volumeInfo"]["publishedDate"].slice(0..3), author: book["volumeInfo"]["authors"][0], publisher: book["volumeInfo"]["publisher"])

  file = URI.open(book["volumeInfo"]["imageLinks"]["thumbnail"])

  new_book.photo.attach(io: file, filename: "book.jpg", content_type: "image/jpg")

  new_book.save!
  puts "Created book number #{index + 1}"
end

puts "Seeded 5 books!"
