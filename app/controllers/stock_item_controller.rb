require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/stock_item.rb')
also_reload('../models/*')

get '/stock_items' do
  @stock_items = StockItem.all()
  @rentals = Rental.all()
  erb(:"stock_items/index")
end

get '/stock_items/new' do
  erb(:"stock_items/new")
end

post '/stock_items' do
  stock_item = StockItem.new(params)
  stock_item.save()
  erb(:"stock_items/success")
end

post '/stock_items/:id/delete' do
  @stock_item = StockItem.find(params[:id])
  @stock_item.delete()
  redirect to '/stock_items'
end
