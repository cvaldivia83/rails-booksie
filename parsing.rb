require "json"
require "open-uri"

google_api= ENV["GOOGLE_BOOK_API"]

url = "https://www.googleapis.com/books/v1/volumes/vU-FAAAAQBAJ?key=#{google_api}"

book_serialized = URI.open(url).read
book = JSON.parse(book_serialized)

puts book["volumeInfo"]["title"]
puts book["volumeInfo"]["subtitle"]
puts book["volumeInfo"]["authors"]
puts book["publisher"]

puts "Starting to seed user"

user = User.new(email: "carla@lewagon.com", password: 123456, username: "queen_c")
user.save!

puts "Seeded 1 User!"

puts "Starting to seed book"
