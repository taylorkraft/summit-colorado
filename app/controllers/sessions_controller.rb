class SessionsController < ApplicationController

  get '/login' do #displays a form where a user can login
      erb :'sessions/login'
  end

  post '/login' do #stores the user and their information, displays user's page relevant to their unique id
    login(params[:email], params[:password])
    current_user
    redirect "/users/#{current_user.id}"
  end
  
  # post '/sessions' do
  #   @user = User.find_by(email: params[:email], password: params[:password])
  #   if @user
  #     session[:user_id] = @user.id
  #     erb :"/sessions/home"
  #   else
  #     redirect '/login'
  #   end
  # end

  post '/logout' do #clears the session (logs out user) and displays 'home' page 
    session.clear
    redirect '/'
  end

end