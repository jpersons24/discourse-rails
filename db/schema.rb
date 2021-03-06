# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_11_142535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "gender"
    t.integer "age"
    t.string "sexual_orientation"
    t.string "race"
    t.string "city"
    t.string "political_party"
    t.string "religion"
    t.boolean "pro_choice"
    t.string "fav_sport"
    t.string "fav_cuisine"
    t.string "fav_book_genre"
    t.string "fav_city"
    t.string "fav_movie_genre"
    t.boolean "is_chatting"
    t.text "previous_matches", default: [], array: true
    t.text "differences", default: [], array: true
    t.text "interests", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "chatting_with"
  end

end
