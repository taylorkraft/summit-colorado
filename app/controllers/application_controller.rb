require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'summit_secret' 
  end

  get "/" do #displays our 'home' page if a user is not logged in already
    if !logged_in? 
      erb :home
    else
      redirect "/users/#{current_user.id}" #if a user is logged in, displays user home page relevant to unique id
    end
  end

  helpers do

    def current_user #if the value to the left is nil or falsey give it the value to the right
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] #if value is established on the left, code to the right will not run
    end

    def logged_in?
      !!current_user
    end

    def login(email, password_digest)
      user = User.find_by(:email => email) 
       if user && user.authenticate(password_digest)
        session[:user_id] = user.id
       else
        redirect '/login'
       end
     end

    def redirect_if_not_logged_in #redirects a user to the login page if they are not already logged in
      redirect '/login' if !logged_in?
    end
  end
end
