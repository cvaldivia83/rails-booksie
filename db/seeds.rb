require "json"
require "open-uri"

puts "Destroying all books and users from DB"

User.destroy_all
Book.destroy_all

puts "Starting to seed users"

email = %w(carla milo patoche zippy kiki kiko mauro dedemenezes barbara juju)

username = %w(queen_c miloinrio patoche zippy kiki kiko mauro djDedeMenezes barbie juju)

portrait_women = [
  "https://newprofilepic2.photo-cdn.net//assets/images/article/profile.webp",
  "https://cdn.pixabay.com/photo/2021/11/12/03/04/woman-6787784_1280.png",
  "https://cdn.pixabay.com/photo/2017/01/27/16/09/people-2013447_1280.jpg",
  "https://cdn.pixabay.com/photo/2015/11/03/10/23/watercolor-1020509_1280.jpg",
  "https://cdn.pixabay.com/photo/2021/04/07/17/01/woman-6159648_1280.jpg",
  "https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_1280.jpg"
]

portrait_men = [
  "https://cdn.pixabay.com/photo/2020/01/07/23/01/sketch-4748895_1280.jpg",
  "https://banner2.cleanpng.com/20180623/iqh/kisspng-computer-icons-avatar-social-media-blog-font-aweso-avatar-icon-5b2e99c40ce333.6524068515297806760528.jpg",
  "https://cdn.pixabay.com/photo/2020/12/14/15/59/man-5831295_1280.jpg"
]

10.times do |i|
  if i == 0
    user = User.new(
      email: "#{email[i]}@lewagon.com", password: 123456, username: "#{username[i]}", admin: true
    )
    portrait = URI.open(portrait_women[i])
    user.photo.attach(io: portrait, filename: "#{email[i]}.jpg", content_type: "image/webp")
    user.save!
    puts "Created user n.#{i + 1}"
  else
    user = User.new(
      email: "#{email[i]}@lewagon.com", password: 123456, username: "#{username[i]}", admin: false
    )

    if email[i] == "patoche" || email[i] == 'kiko' || email[i] == 'mauro' || email[i] == 'dedemenezes'
      portrait = URI.open(portrait_men.sample)
    else
      portrait = URI.open(portrait_women[2..10].sample)
    end
    user.photo.attach(io: portrait, filename: "#{email[i]}.jpg", content_type: "image/jpg")
    user.save!
    puts "Created user n.#{i + 1}"
  end
end

# creating books

users = User.all

# Retrieve a specific volume from Google's Book API
book_ids = ['EezJAwAAQBAJ', 'vU-FAAAAQBAJ', 'ss4RngEACAAJ', 'hHCKDwAAQBAJ', '7cibSgAACAAJ', '5KlizgEACAAJ', 'YmAvDwAAQBAJ', 'fWfXDwAAQBAJ', 'KnNWD9EYCGgC', 'unDkwgEACAAJ', 'lMYpEAAAQBAJ', 'szm-8WgGjWgC', 'yIwJBOQJ_7gC']

google_api= ENV["GOOGLE_BOOKS"]

puts "Starting to seed books"

book_ids.each_with_index do |book, index|
  url = "https://www.googleapis.com/books/v1/volumes/#{book}?key=#{google_api}"
  book_serialized = URI.open(url).read
  book = JSON.parse(book_serialized)
  new_book = Book.new(
    title: book["volumeInfo"]["title"],
    description: book["volumeInfo"]["description"],
    year: book["volumeInfo"]["publishedDate"].slice(0..3),
    isbn: book["volumeInfo"]["industryIdentifiers"][1]["identifier"],
    author: book["volumeInfo"]["authors"][0],
    publisher: book["volumeInfo"]["publisher"], user: users[2..10].sample
  )

  file = URI.open(book["volumeInfo"]["imageLinks"]["thumbnail"])

  new_book.photo.attach(io: file, filename: "book_#{index + 1}.jpg", content_type: "image/jpg")

  new_book.save!
  puts "Created book number #{index + 1}"
end

puts "Seeded #{book_ids.length} books!"
