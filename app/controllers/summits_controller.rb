class SummitsController < ApplicationController

  post '/summits/:id' do
    mountain = Mountain.find_by_id(params[:id])
    if logged_in?
      current_user.mountains << mountain
      redirect "/users/#{current_user.id}"
    else
      redirect "/login"
    end
  end

  delete '/summits' do
    summit = Summit.find_by(mountain_id: params[:mountain_id], user_id: params[:user_id])
    if logged_in? && summit.user_id == current_user.id
      summit.destroy
      redirect "/users/#{current_user.id}"
    end
  end
end