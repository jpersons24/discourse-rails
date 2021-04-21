class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :gender
      t.integer :age
      t.string :sexual_orientation
      t.string :race
      t.string :city
      t.string :political_party
      t.string :religion
      t.boolean :pro_choice
      t.string :fav_sport
      t.string :fav_cuisine
      t.string :fav_book_genre
      t.string :fav_city
      t.string :fav_movie_genre
      t.boolean :is_chatting
      t.text :previous_matches, array: true, default: []

      t.timestamps
    end
  end
end
