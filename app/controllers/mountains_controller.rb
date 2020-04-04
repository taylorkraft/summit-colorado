class MountainsController < ApplicationController

    
  get '/mountains' do  #display a list of all mountains
    @mountains = Mountain.all

    erb :"mountains/index"
  end

  get '/mountains/new' do #parses 'new' erb to display mountain form 
    redirect_if_not_logged_in

    erb :'/mountains/new'
  end

    
  get '/mountains/:id' do #displays a specific mountain based on id
      @mountain = Mountain.find_by_id(params[:id]) #params available bc of bcrypt gem
      if @mountain
        erb :"mountains/show"
      else
        redirect '/mountains' #if the id does not exist, user is redirected to mountain index
      end
  end

  post '/mountains' do
    @mountain = Mountain.new(name: params[:name], elevation: params[:elevation])
    if @mountain.valid?
      @mountain.save
      session[:id] = @mountain.id
      redirect "/mountains/#{@mountain.id}"
    else
      redirect "/mountains"
    end
  end
end