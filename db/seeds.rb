require 'faker'

# Chad and Josh should match


puts 'creating users'

gender = [
  "man",
  "woman",
  "non-binary",
  "trans",
  "other",
]

sexual_orientation = [
  "asexual",
  "bi-sexual",
  "heterosexual",
  "homosexual",
  "unknown",
]

race = [
  "asian",
  "black",
  "hispanic",
  "middle eastern",
  "other",
  "white",
]

city = [
  "new york",
  "los angeles",
  "washington dc",
  "chicago",
  "dallas",
  "miami",
]

political_party = [
  "democratic",
  "independent",
  "republican",
  "other",
]

religion = [
  "buddhist",
  "christian",
  "hindu",
  "jewish",
  "muslim",
  "other",
]

sport = [
  "baseball",
  "basketball",
  "football",
  "golf",
  "hockey",
  "lacrosse",
  "soccer",
  "softball",
  "tennis",
]

cuisine = [
  "chinese",
  "french",
  "indian",
  "italian",
  "japanese",
  "mediterranean",
  "mexican",
  "other",
]

book = [
  "fantasy",
  "fiction",
  "mystery",
  "non-fiction",
  "romance",
  "thriller",
  "other",
]

movie = [
  "action",
  "comedy",
  "drama",
  "horror",
  "documentary",
  "other",
]

choice = [
  true,
  false
]


50.times do 
  User.create(
    username: Faker::Name.first_name,
    password: "123",
    gender: gender.sample,
    age: rand(18..99),
    sexual_orientation: sexual_orientation.sample,
    race: race.sample,
    city: city.sample,
    political_party: political_party.sample,
    religion: religion.sample,
    pro_choice: choice.sample,
    fav_sport: sport.sample,
    fav_cuisine: cuisine.sample,
    fav_book_genre: book.sample,
    fav_city: city.sample,
    fav_movie_genre: movie.sample,
    is_chatting: false
    )
  end
  User.create(username: "Chad", password: "123", gender: "trans", age: 18, sexual_orientation: "
  homosexual", race: "white", city: "NYC", political_party: "republican", pro_choice: false, religion: "christian", fav_sport: "baseball", fav_cuisine: "japanese", fav_book_genre: "romance", fav_city: "LA", fav_movie_genre: "action", is_chatting: false, previous_matches: [] )
  
  User.create(username: "Josh", password: "123", gender: "man", age: 35, sexual_orientation: "
  homosexual", race: "black", city: "Philly", political_party: "republican", pro_choice: true, fav_sport: "baseball", religion: "muslim", fav_cuisine: "mexican", fav_book_genre: "romance", fav_city: "Boston", fav_movie_genre: "action", is_chatting: false, previous_matches: [] )
  
  
  # Jamal and Wendy should match
  User.create(username: "Jamal", password: "123", gender: "man", age: 26, sexual_orientation: "
  heterosexual", race: "asian", city: "NYC", political_party: "democrat", pro_choice: true, religion: "jewish", fav_sport: "basketball", fav_cuisine: "chinese", fav_book_genre: "horror", fav_city: "Detroit", fav_movie_genre: "comedy", is_chatting: false, previous_matches: [] )
  
  User.create(username: "Wendy", password: "123", gender: "woman", age: 29, sexual_orientation: "
  bi-sexual", race: "middle eastern", city: "NYC", political_party: "libertarian", pro_choice: true, religion: "hindu", fav_sport: "basketball", fav_cuisine: "greek", fav_book_genre: "horror", fav_city: "Detroit", fav_movie_genre: "romance", is_chatting: false, previous_matches: [] )
  
  puts 'all done'
  