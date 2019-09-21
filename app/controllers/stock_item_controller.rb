require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stock_item.rb')
also_reload('../models/*')

get '/stock_items' do
  @stock_items = StockItem.all()
  erb(:"stock_items/index")
end

get '/stock_items/new' do
  erb(:"stock_items/new")
end
