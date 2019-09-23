require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/rental.rb')
also_reload('../models/*')

get '/rentals' do
  @rentals = Rental.all
  erb(:"rentals/index")
end

get '/rentals/new' do
  @rentals = Rental.all
  @customers = Customer.all
  @stock_items = StockItem.all
  erb(:"rentals/new")
end

post '/rentals' do
  rental = Rental.new(params)
  rental.save()
  erb(:"rentals/create_success")
end

post '/rentals/:id/delete' do
  @rental = Rental.find(params[:id])
  @rental.delete()
  redirect to '/rentals'
end
