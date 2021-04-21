# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Chad and Josh should match
User.create(username: "Chad", password: "123", gender: "trans", age: 18, sexual_orientation: "
homosexual", race: "white", city: "NYC", political_party: "republican", pro_choice: false, religion: "christian", fav_sport: "baseball", fav_cuisine: "japanese", fav_book_genre: "romance", fav_city: "LA", fav_movie_genre: "action", is_chatting: false, previous_matches: [] )

User.create(username: "Josh", password: "123", gender: "man", age: 35, sexual_orientation: "
homosexual", race: "black", city: "Philly", political_party: "republican", pro_choice: true, fav_sport: "baseball", religion: "muslim", fav_cuisine: "mexican", fav_book_genre: "romance", fav_city: "Boston", fav_movie_genre: "action", is_chatting: false, previous_matches: [] )


# Jamal and Wendy should match
User.create(username: "Jamal", password: "123", gender: "man", age: 26, sexual_orientation: "
heterosexual", race: "asian", city: "NYC", political_party: "democrat", pro_choice: true, religion: "jewish", fav_sport: "basketball", fav_cuisine: "chinese", fav_book_genre: "horror", fav_city: "Detroit", fav_movie_genre: "comedy", is_chatting: false, previous_matches: [] )

User.create(username: "Wendy", password: "123", gender: "woman", age: 29, sexual_orientation: "
bi-sexual", race: "middle eastern", city: "NYC", political_party: "libertarian", pro_choice: true, religion: "hindu", fav_sport: "basketball", fav_cuisine: "greek", fav_book_genre: "horror", fav_city: "Detroit", fav_movie_genre: "romance", is_chatting: false, previous_matches: [] )
