require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'summit_secret' 
  end

  get "/" do
    if !logged_in? 
      erb :home
    else
      redirect "sessions/home/#{@user.id}"
    end
  end

  helpers do

    def logged_in?
      @user # !!@user
    end

    def redirect_if_not_logged_in
      redirect '/login' if !logged_in?
    end

  end
end
