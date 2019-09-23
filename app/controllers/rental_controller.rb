require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/rental.rb')
also_reload('../models/*')

get '/rentals' do
  @rentals = Rental.all
  erb(:"rentals/index")
end

get '/rentals/new' do
  erb(:"rentals/new")
end

post '/rentals/:id/delete' do
  @rental = Rental.find(params[:id])
  @rental.delete()
  redirect to '/rentals'
end
