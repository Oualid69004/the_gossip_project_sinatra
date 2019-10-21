require 'bundler'
Bundler.require

require 'gossip'
class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end


  post '/gossips/new/' do
    Gossip.new(params['author'],params['content']).save
    redirect '/'
  end

  get '/gossips/:id' do

   #"#{params['id']} !"
     #nb=params['id']
     #Gossip.find(nb.to_i).author
     #Gossip.find(nb.to_i).content
    erb :show

  end
end


