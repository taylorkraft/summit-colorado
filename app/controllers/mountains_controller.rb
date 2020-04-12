class MountainsController < ApplicationController

  # GET: /mountains 
  get '/mountains' do  #display a list of all mountains
    @mountains = Mountain.all

    erb :"mountains/index"
  end
  #GET: /mountains/new
  get '/mountains/new' do #parses 'new' erb to display mountain form 
    if logged_in?
      erb :"/mountains/new"
    else
      redirect '/users/login'
    end
  end

  #GET: /mountains/5
  get '/mountains/:id' do #displays a specific mountain based on id
      @mountain = Mountain.find_by_id(params[:id]) #params available bc of bcrypt gem
      if @mountain
        erb :"mountains/show"
      else
        redirect '/mountains' #if the id does not exist, user is redirected to mountain index
      end
  end

  #POST: /mountains
  post '/mountains' do
    @mountain = Mountain.create(name: params[:name], elevation: params[:elevation])
    if @mountain.valid?
      @mountain.user_id = current_user.id
      @mountain.save
      redirect "/users/#{current_user.id}"
    else
      redirect '/mountains'
    end
  end

  patch '/mountains/:id' do 
    @mountain = Mountain.find_by_id(params[:id])
    if @mountain.update(params[:mountain])
      redirect "/mountains/#{@mountain.id}"
    else
      redirect "/mountains/#{@mountain.id}/edit"
    end
  end

  delete '/mountains/:id' do 
    @mountain = Mountain.find_by_id(params[:id])
    if @mountain.destroy
      redirect '/mountains'
    else
      redirect "/mountains/#{@mountain.id}"
    end
  end

  #GET: /mountains/5/edit
  get '/mountains/:id/edit' do
    @mountain = Mountain.find_by_id(params[:id]) #finds a mountain by id - stores in instance variable
    if @mountain #validates a mountain, if it exists displays a form to edit their mountain entry
      erb :"mountains/edit" 
    else
      redirect '/mountains' #if the id is not found, redirects to mountain index page
    end
  end
end
