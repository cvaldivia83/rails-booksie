require 'json'
require 'open-uri'
require 'faker'

puts 'Destroying all books and users from DB'

User.destroy_all
Rating.destroy_all
Book.destroy_all
Comment.destroy_all
Post.destroy_all
Wishlist.destroy_all
List.destroy_all
Booking.destroy_all

addresses = [
  { city: 'Rio de Janeiro', country: 'Brasil', address: 'Rua Visconde de Pirajá, 142' },
  { city: 'Rio de Janeiro', country: 'Brasil', address: 'Rua Aires Saldanha, 25' },
  { city: 'Rio de Janeiro', country: 'Brasil', address: 'Rua Carlos Oswald, 230' },
  { city: 'Rio de Janeiro', country: 'Brasil', address: 'Rua Ipanema, 75' },
  { city: 'Macaé', country: 'Brasil', address: 'Avenida Nossa Senhora da Glória, 1121' },
  { city: 'Arequipa', country: 'Peru', address: '11, Avenida Lambramani' },
  { city: 'Saint-Denis', country: 'France', address: '15 Rue Génin' },
  { city: 'Paris', country: 'France', address: "90 Avenue d'Italie" }
]

puts 'Starting to seed users'

email = %w(carla milo patoche zippy kiki kiko mauro dedemenezes barbara juju)

username = %w(queen_c miloinrio patoche zippy kiki kiko mauro djDedeMenezes barbie juju)

portrait_women = [
  'https://newprofilepic2.photo-cdn.net//assets/images/article/profile.webp',
  'https://cdn.pixabay.com/photo/2021/11/12/03/04/woman-6787784_1280.png',
  'https://cdn.pixabay.com/photo/2017/01/27/16/09/people-2013447_1280.jpg',
  'https://cdn.pixabay.com/photo/2015/11/03/10/23/watercolor-1020509_1280.jpg',
  'https://cdn.pixabay.com/photo/2021/04/07/17/01/woman-6159648_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_1280.jpg', 'https://img.freepik.com/free-photo/shallow-focus-shot-african-american-female-with-tattoos-wearing-purple-shirt-sunglasses_181624-41271.jpg?w=1380&t=st=1680627915~exp=1680628515~hmac=265a714a169c0c5a010416cb5e1a7765c79290c7c3c1d8a33bcc2253d6ada71b'
]

portrait_men = [
  'https://img.freepik.com/free-vector/mysterious-gangster-mafia-character-smoking_23-2148474614.jpg?w=826&t=st=1680627610~exp=1680628210~hmac=85ef56af802c2fc8939728a6813e0aeea7c3efd78cdeae169f1812b266506760',
  'https://img.freepik.com/free-vector/mysterious-mafia-man-wearing-hat_52683-34829.jpg?w=826&t=st=1680627628~exp=1680628228~hmac=b3d61a90434027d819229efc5f22467a30dac70a1ba939a2c2cabd9f7ee379e7', 'https://img.freepik.com/free-psd/3d-illustration-business-man-with-glasses_23-2149436194.jpg?w=826&t=st=1680627693~exp=1680628293~hmac=90e16d055b5f2ee28553a29e034832bacccbcce8f6b63ab303ba687b2f803b05', 'https://img.freepik.com/free-vector/mysterious-gangster-character_23-2148483453.jpg?w=826&t=st=1680627737~exp=1680628337~hmac=20d165d960a99cfb4fc0a21a8f45c45d45668212e2dc03e24607343aa269a9aa', 'https://img.freepik.com/free-vector/mysterious-gangster-character_23-2148466806.jpg?w=826&t=st=1680627776~exp=1680628376~hmac=97c984caa04e26bc85263e44657c73bb398f50d751b275c2dd132b2b1062d223'
]

booksie = [true, false].sample

10.times do |i|
  new_address = addresses.sample
  if i == 0
    user = User.new(
      email: "#{email[i]}@lewagon.com", password: 123456, username: "#{username[i]}", admin: true, super_booksie: true, bio: "#{Faker::Quotes::Shakespeare.romeo_and_juliet_quote}", address: new_address[:address], city: new_address[:city], country: new_address[:country]
    )
    portrait = URI.open(portrait_women[i])
    user.photo.attach(io: portrait, filename: "#{email[i]}.jpg", content_type: 'image/webp')
    user.save!

    puts "Created user n.#{i + 1}"
  else
    user = User.new(
      email: "#{email[i]}@lewagon.com", password: 123456, username: "#{username[i]}", admin: false, bio: "#{Faker::Quotes::Shakespeare.romeo_and_juliet_quote}", address: new_address[:address], city: new_address[:city], country: new_address[:country]
    )

    if email[i] == "patoche" || email[i] == 'kiko' || email[i] == 'mauro' || email[i] == 'dedemenezes'
      portrait = URI.open(portrait_men.sample)
    else
      portrait = URI.open(portrait_women[2..10].sample)
    end
    user.photo.attach(io: portrait, filename: "#{email[i]}.jpg", content_type: 'image/jpg')
    user.save!
    puts "Created user n.#{i + 1}"
  end
end

# creating books

users = User.all

# Retrieve a specific volume from Google's Book API
book_ids = ['EezJAwAAQBAJ', 'vU-FAAAAQBAJ', 'ss4RngEACAAJ', 'hHCKDwAAQBAJ', '7cibSgAACAAJ', '5KlizgEACAAJ', 'Xk_YAAAAMAAJ', 'upb5DwAAQBAJ', 'dMBZjwEACAAJ', 'frx1jwEACAAJ', '7ERzDwAAQBAJ', 'gIGUEAAAQBAJ' ]

google_api = ENV['GOOGLE_BOOKS']

puts 'Starting to seed books'

book_ids.each_with_index do |book, index|
  url = "https://www.googleapis.com/books/v1/volumes/#{book}?key=#{google_api}"
  book_serialized = URI.open(url).read
  book = JSON.parse(book_serialized)
  new_book = Book.new(
    title: book['volumeInfo']['title'],
    description: book['volumeInfo']['description'],
    year: book['volumeInfo']['publishedDate'].slice(0..3),
    isbn: book['volumeInfo']['industryIdentifiers'][1]['identifier'],
    author: book['volumeInfo']['authors'][0],
    publisher: book['volumeInfo']['publisher'],
    user: users[2..10].sample
  )

  file = URI.open(book['volumeInfo']['imageLinks']['thumbnail'])

  new_book.photo.attach(io: file, filename: "book_#{index + 1}.jpg", content_type: 'image/jpg')

  new_book.save!
  puts "Created book number #{index + 1}"

  rating_book = Rating.new(rating: book['volumeInfo']['averageRating'].to_i, book: new_book, user: users[1..10].sample)

  rating_book.save!

  puts "Created Book number #{index + 1} * RATING"
end

puts "Seeded #{book_ids.length} books!"

puts 'Creating Posts...'

post = Post.new(
  title: 'Readers\' Most Anticipated Books of April',
  content: "At the beginning of each calendar month, Goodreads\' crack editorial squad assembles a list of the best, hottest, and most popular new books hitting shelves, actual and virtual. The list is generated by readers\' early reviews and by tracking which titles are being added to Want to Read shelves by Goodreads regulars.\n
  New in April: Sally Hepworth investigates a rash of Australian suicides in The Soulmate. Brendan Slocumb uncovers a musical conspiracy in Symphony of Secrets.\n And V. Castro explores ghostly Mexican mythology in The Haunting of Alejandra.\n Also on tap: conflicted androids, creepy beauty boutiques, and a new novel from historical fiction ace Charles Frazier.",
  date: Date.new(2022, 12, 27),
  user_id: User.first.id
)

file = URI.open("https://images.pexels.com/photos/3747468/pexels-photo-3747468.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")

post.photo.attach(io: file, filename: "post_1.jpg", content_type: "image/jpg")

post.save!

post_two = Post.create!(
  title: "<h1>This is just a test for a title</h1>",
  content: "<p>For most people, trekking through the mountains or sampling French cuisine is a rare treat. For travel writers, it might just be another day on the job. As their job title suggests, travel writers create content about anything and everything related to exploring the world. </p><p>Whether they’re writing to help readers plan a trip or to transport them — through words — to places they may never visit, no two travel writers share the same journey through their careers. But if you intend to walk down this road and become a travel writer, here are five steps to help you on your professional adventure.</p><p>Readers want you to take them on a journey with you. If you can’t pay for them to join you on a sea voyage to the Azores, you’ll have to settle for evoking the five senses and other descriptive writing techniques. </p>",
  date: Date.today,
  user_id: User.last.id
)

file_two = URI.open("https://blog-cdn.reedsy.com/directories/admin/featured_image/723/medium_how-to-become-a-travel-writer-072b11.jpg")

post_two.photo.attach(io: file_two, filename: "post_1.jpg", content_type: "image/jpg")

post_two.save!

puts 'Created 2 posts...'

3.times do |i|
  comment = Comment.new(
    content: Faker::Lorem.sentence(word_count: rand(11..25), supplemental: false, random_words_to_add: rand(1..7)),
    date: Date.new(2023, rand(1..12), rand(1..27)),
    post: post,
    user: users[2..10].sample
  )
  comment.save!

  puts "Created comment n. #{i + 1}"
end

puts 'Finished seeding!'
