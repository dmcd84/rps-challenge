require './lib/player'
require './lib/game'
require 'sinatra/base'

class RockPaperScissiors < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    redirect '/play'
  end

  get '/play' do
    @player_1_name = session[:player_1_name]
    erb :play
  end

  post '/play' do
    session[:weapon] = params[:weapon]
    redirect '/attack'
  end

  get '/attack' do
    @weapon_choice = session[:weapon]
    erb :attack
  end
end
