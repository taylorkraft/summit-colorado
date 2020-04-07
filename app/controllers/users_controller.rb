class UsersController < ApplicationController

  # GET: /users
  get '/users' do #displays an index of all users
    @users = User.all
    erb :"/users/index.html"
  end

  # GET: /users/new
  get '/signup' do #displays a form that allows a user to signup for an account
    erb :"/users/new.html"
  end

  # POST: /users
  post '/users' do #defines a user and their params
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.valid?
      @user.save #saves user instance
      session[:user_id] = @user.id # setting user id equal to session id
      redirect "/users/#{current_user.id}" #redirects a user to their unique home page
    else
      redirect '/users/signup' #if a user is not valid, redirects to signup - allowing a user to create a valid account
    end
  end

  # GET: /users/5
  get '/users/:id' do #displays a specific user's portfolio based on their id
    @user = User.find_by_id(params[:id])
    if @user
      erb :"/users/show.html"
    else
      redirect '/users'
    end
  end
end


