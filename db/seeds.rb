require 'json'
require 'open-uri'
require 'faker'


users = [
  {
    email: 'carla',
    username: 'queen_c',
    admin: true,
    address: { city: 'Arequipa', country: 'Peru', address: '11, Avenida Lambramani' },
    picture: 'https://newprofilepic2.photo-cdn.net//assets/images/article/profile.webp'
  },
  {
    email: 'milo',
    username: 'miloinrio',
    admin: false,
    address: { city: 'Paris', country: 'France', address: "90 Avenue d'Italie" },
    picture: 'https://cdn.pixabay.com/photo/2017/01/27/16/09/people-2013447_1280.jpg'
  },
  {
    email: 'patrick',
    username: 'patoche',
    admin: false,
    address: { city: 'Macaé', country: 'Brasil', address: 'Avenida Nossa Senhora da Glória, 1121' },
    picture: 'https://img.freepik.com/free-psd/3d-illustration-business-man-with-glasses_23-2149436194.jpg?w=826&t=st=1680627693~exp=1680628293~hmac=90e16d055b5f2ee28553a29e034832bacccbcce8f6b63ab303ba687b2f803b05'
  },
  {
    email: 'zippora',
    username: 'zippy',
    admin: false,
    address: { city: 'Rio de Janeiro', country: 'Brasil', address: 'Rua Visconde de Pirajá, 8' },
    picture: 'https://cdn.pixabay.com/photo/2021/11/12/03/04/woman-6787784_1280.png'
  },
  {
    email: 'kiki',
    username: 'kiki',
    admin: false,
    address: { city: 'Rio de Janeiro', country: 'Brasil', address: 'Rua Aires Saldanha, 25' },
    picture: 'https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_1280.jpg'
  },
  {
    email: 'kiko',
    username: 'kiko',
    admin: false,
    address: { city: 'Rio de Janeiro', country: 'Brasil', address: 'Rua Aires Saldanha, 25' },
    picture: 'https://img.freepik.com/free-vector/mysterious-gangster-character_23-2148483453.jpg?w=826&t=st=1680627737~exp=1680628337~hmac=20d165d960a99cfb4fc0a21a8f45c45d45668212e2dc03e24607343aa269a9aa'
  },
  {
    email: 'mauricio',
    username: 'mauro',
    admin: false,
    address: { city: 'Rio de Janeiro', country: 'Brasil', address: 'Rua Ipanema, 75' },
    picture: 'https://img.freepik.com/free-vector/mysterious-gangster-character_23-2148483453.jpg?w=826&t=st=1680627737~exp=1680628337~hmac=20d165d960a99cfb4fc0a21a8f45c45d45668212e2dc03e24607343aa269a9aa'
  },
  {
    email: 'dedemenezes',
    username: 'djDede',
    admin: false,
    address: { city: 'Rio de Janeiro', country: 'Brasil', address: 'Rua Visconde de Pirajá, 142' },
    picture: 'https://img.freepik.com/free-vector/mysterious-gangster-character_23-2148466806.jpg?w=826&t=st=1680627776~exp=1680628376~hmac=97c984caa04e26bc85263e44657c73bb398f50d751b275c2dd132b2b1062d223'
  },
  {
    email: 'barbara',
    username: 'barbie',
    admin: false,
    address: { city: 'Rio de Janeiro', country: 'Brasil', address: 'Rua Visconde de Pirajá, 142' },
    picture: 'https://cdn.pixabay.com/photo/2021/04/07/17/01/woman-6159648_1280.jpg'
  },
  {
    email: 'juju',
    username: 'juju',
    admin: false,
    address: { city: 'Rio de Janeiro', country: 'Brasil', address: 'Rua Carlos Oswald, 230' },
    picture: 'https://cdn.pixabay.com/photo/2018/03/12/12/32/woman-3219507_1280.jpg'
  },
  {
    email: 'sabilah',
    username: 'sabs',
    admin: false,
    address: { city: 'Saint-Denis', country: 'France', address: '15 Rue Génin' },
    picture: 'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2000&q=80'
  }
]


puts 'Destroying all records from DB'

User.destroy_all
Rating.destroy_all
Book.destroy_all
Comment.destroy_all
Post.destroy_all
Wishlist.destroy_all
List.destroy_all
Booking.destroy_all

puts 'Creating users...'


users.each_with_index do |user, i|

  new_user = User.new(
    email: "#{user[:email]}@lewagon.com",
    password: 123456,
    username: "#{user[:username]}",
    admin: user[:admin],
    super_booksie: false,
    bio: "#{Faker::Quotes::Shakespeare.romeo_and_juliet_quote}", address: user[:address][:address],
    city: user[:address][:city],
    country: user[:address][:country]
  )

  file = URI.open(user[:picture])

  new_user.photo.attach(io: file, filename: "#{user[:username]}.jpg", content_type: 'image/jpg')

  new_user.save!

  puts "Created user n.#{i + 1}"

end

puts 'Finished seeding users'

# books

users = User.all

books = ['EezJAwAAQBAJ', 'vU-FAAAAQBAJ', 'ss4RngEACAAJ', 'hHCKDwAAQBAJ', '7cibSgAACAAJ', '5KlizgEACAAJ', 'Xk_YAAAAMAAJ', 'upb5DwAAQBAJ', 'dMBZjwEACAAJ', 'frx1jwEACAAJ', '7ERzDwAAQBAJ', 'gIGUEAAAQBAJ' ]


puts 'Starting to seed books'

google_api = ENV['GOOGLE_BOOKS']

books.each_with_index do |book, index|
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

puts "Seeded #{books.length} books!"

puts 'Seeding posts'

post = Post.new(
  title: 'Gerda Lerner\'s Work and History',
  rich_content: '"The Creation of Patriarchy" by historian Gerda Lerner is a work of scholarship which was eight years in the making. In the book, in order to explain women\'s subordination Gerda puts it in a historical context.
  Lerner\'s work gives insights into how women have been systematically subordinated over centuries of creation of the structures of patriarchy. These structures kept women in inferior positions, tied them to norms which they -apparently- willingly conformed to. The book and its findings are based on the study of western civilizations, largely derived from Mesopotamian, and Hebrew sources and a study of Abrahmanic religions.
  Man has been the default human now, for centuries. Patriarchal thinking and its norms are so deeply entrenched in our society that we take it for granted. This default and so much part of our cultural and mental landscape, we do not even notice it. Not unlike the furniture strewn around your home for months, in the same position. You notice a particular piece only when you move it around into a new arrangement.
  Historical scholarship has seen women as marginal to the making of civilization and as unessential to those pursuits defined as having historic significance. While no man has been excluded from historic records because he is man, yet all women were. Though numerically, women are the majority, we are structured as if we are the minority and and have therefore been victimized by it. Women were essential to creating history, to creating society. They are and always have been agents and actors in history. Women have simply been kept from knowing their history and from interpreting it. They have been excluded from writing symbols, philosophies, science and law, and excluded from theory formation. Gerda explores how, as laws evolved and religions grew, women\'s inferior position in society deteriorated. They were kept away from any learning or intellectual pursuits. She tells us how the lack of women\'s access to learning and religion was increasingly reduced, till their eventual cutting off from all sources of history making.',
  date: Date.today,
  user: User.first
)

picture = URI.open('https://miro.medium.com/v2/resize:fit:1400/format:webp/1*7-PGFpd3V-jP3701iAjAxg.jpeg')

post.photo.attach(io: picture, filename: "nes.png", content_type: "image/png")

post.save!

puts 'Seeded 1 post'
