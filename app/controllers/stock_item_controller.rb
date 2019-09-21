require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/stock_item.rb')
also_reload('../models/*')

get '/stock_items' do
  @stock_items = StockItem.all()
  erb(:"stock_items/index")
end

# get '/stock_items/:id' do # show
#   @item = StockItem.find( params[:id] )
# end

get '/stock_items/new' do
  erb(:"stock_items/new")
end

post '/stock_items' do
  stock_item = StockItem.new(params)
  stock_item.save()
  erb(:"stock_items/success")
end

# post '/stock_items/delete' do
#   StockItem.delete()
#   erb(:"stock_items/delete_success")
# end
