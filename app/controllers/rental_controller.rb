require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/rental.rb')
also_reload('../models/*')

get '/rentals' do
  @rentals = Rental.all
  erb(:"rentals/index")
end
