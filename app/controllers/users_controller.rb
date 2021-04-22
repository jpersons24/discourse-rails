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
      params.permit(:username, :password, :gender, :age, :sexual_orientation, :race, :city, :political_party, :religion, :pro_choice, :fav_sport, :fav_cuisine, :fav_book_genre, :fav_city, :fav_movie_genre, :is_chatting, previous_matches: [])
    end
   
end

