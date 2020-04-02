class SessionsController < ApplicationController

  get '/signup' do
    if !logged_in?
       erb :'sessions/signup'
    else
      redirect "sessions/home/#{@user.id}"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'sessions/login'
    else
      redirect "/sessions/home/#{@user.id}" #redirecting back to login page
    end
  end

  post '/sessions' do
    @user = User.find_by(email: params[:email], password_digest: params[:password_digest])
    if @user
      session[:user_id] = @user.id
      redirect '/sessions/home'
    else
      redirect '/login'
    end
  end
  
  get '/sessions/home' do

    @user = User.find_by(session[:user_id])
    erb :'/sessions/home'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end