require 'pry'

class ApplicationController < Sinatra::Base 
  set :default_content_type, 'application/json'
  
  get '/bakeries' do
    "Hello World"
    #get all the bakeries from the database
    bakeries = Bakery.all
    #send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    #get one bakery from database by id
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include:[:baked_goods])


   end

   get '/baked_goods/by_price' do
     baked_goods = BakedGood.all.order(params[:price])
     baked_goods.to_json(include[:name])
   end
end