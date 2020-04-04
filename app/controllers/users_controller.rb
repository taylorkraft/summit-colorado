class UsersController < ApplicationController

  # GET: /users
  get "/users" do #displays an index of all users
    @users = User.all
    erb :"/users/index.html"
  end

  # GET: /users/signup
  get "/signup" do #displays a form that allows a user to signup for an account
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do #defines a user and their params
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.valid?
      @user.save #saves user instance
      session[:user_id] = @user.id # setting user id equal to session id
      redirect "/users/#{current_user.id}" #redirects a user to their unique home page
    else
      redirect "/users/signup" #if a user is not valid, redirects to signup - allowing a user to create a valid account
    end
  end

  # GET: /users/5
  get "/users/:id" do #displays a specific user's portfolio based on their id
    @user = User.find_by_id(params[:id])
    if @user
      erb :"/users/show.html"
    else
      redirect '/users'
    end
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    @user = User.find_by_id(params[:id]) #finds a user by id - stores in instance variable
    if @user #validates a user, if they exist displays a form to edit their user info
      erb :"/users/edit.html" 
    else
      redirect '/users' #if the id is not found, redirects to user index page
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
