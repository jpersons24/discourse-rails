require 'stream-chat'

class UsersController < ApplicationController

   def index
      users = User.all
      render json: users
   end

  #  /POST /login
  def login
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      render json: { status: true, user: user, token: chat_token(user.username) }
    else
      render json: { status: false, message: "Incorrect username or password"}
    end
  end


   def create
      user = User.find_by(username: user_params[:username])
  
      if user.nil?
        user = User.create(user_params)
        if user.valid?
          user.save
          render json: { status: true, user: user, token: chat_token(user.username) }
          return
        end
  
        render json: { status: false, message: 'username already taken' }
        return
      end
  
      unless user.authenticate(user_params[:password])
        render json: { status: false, message: 'Invalid password provided' }
        return
      end
  
      render json: { status: true, user: user, token: chat_token(user.username) }
    end

    def update 
      user = User.find(params[:id])

      user.update(user_params)
      render json: { status: true, user: user, token: chat_token(user.username) }
    end
    
    def match
      user = User.find(params[:id])
      found_user = nil
      if user.previous_matches.length > 0
        found_user = User.find_by(username: user.previous_matches[0])
        render json: { status: true, user: found_user, token: chat_token(found_user.username) }
        return
      end
      filtered_users = User.all.filter do |user_option|
        user_option.is_chatting === false
      end
      new_connections = filtered_users.filter do |user_option|
        !user.previous_matches.include?(user_option.username)
      end

      collected_array = []
      final_differences = []
      final_interests = []

      new_connections.each do |user_option|
        differences_array = []
        interests_array = []

        belief_counter = 0
        interest_counter = 0

        if user_option.gender != user.gender
          belief_counter += 1
          differences_array.push("gender")
        end

        if user_option.sexual_orientation != user.sexual_orientation
          belief_counter += 1
          differences_array.push("sexual orientation")
        end

        if user_option.race != user.race
          belief_counter += 1
          differences_array.push("race")
        end

        if user_option.religion != user.religion
          belief_counter += 1
          differences_array.push("religion")
        end

        if user_option.pro_choice != user.pro_choice
          belief_counter += 1
          differences_array.push("abortion")
        end

        if user_option.political_party != user.political_party
          belief_counter += 1
          differences_array.push("politics")
        end

        if user_option.fav_sport == user.fav_sport
          interest_counter += 1
          interests_array.push("favorite sport")
        end

        if user_option.fav_cuisine == user.fav_cuisine
          interest_counter += 1
          interests_array.push("favorite cuisine")
        end

        if user_option.fav_book_genre == user.fav_book_genre
          interest_counter += 1
          interests_array.push("favorite book genre")
        end

        if user_option.fav_city == user.fav_city
          interest_counter += 1
          interests_array.push("favorite city")
        end

        if user_option.fav_movie_genre == user.fav_movie_genre
          interest_counter += 1
          interests_array.push("favorite movie genre")
        end

        if belief_counter >= 3 && interest_counter >= 3
          collected_array.push(user_option)
          final_differences.push(differences_array)
          final_interests.push(interests_array)
        end
      end
      user.update(differences: final_differences[0], interests: final_interests[0])
      found_user = User.find_by(username: collected_array[0].username)
      found_user.update(differences: final_differences[0], interests: final_interests[0])
      render json: { status: true, user: found_user, token: chat_token(found_user.username) }
    end
  
    private
  
    def chat_token(username)
      client = StreamChat::Client.new(api_key = Rails.configuration.stream_api_key, api_secret = Rails.configuration.stream_api_secret)
      token = client.create_token(username)
      client.update_user({ id: username, name: username })
  
      chan = client.channel('messaging', channel_id: 'rails-chat')
      chan.create('admin')
      chan.add_members(['admin', username])
      token
    rescue StandardError => e
      p e
      ''
    end
  
    def user_params
      params.permit(:username, :password, :gender, :age, :sexual_orientation, :race, :city, :political_party, :religion, :pro_choice, :fav_sport, :fav_cuisine, :fav_book_genre, :fav_city, :fav_movie_genre, :is_chatting, previous_matches: [], differences: [], interests: [])
    end
   
end

