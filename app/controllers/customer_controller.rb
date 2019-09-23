require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/customer.rb')
also_reload('../models/*')

get '/customers' do
  @rentals = Rental.all
  @customers = Customer.all
  erb(:"customers/index")
end

get '/customers/new' do
  erb(:"customers/new")
end

post '/customers' do
  customer = Customer.new(params)
  customer.save()
  erb(:"customers/add_success")
end

get '/customers/:id/edit' do
  @customer = Customer.find(params[:id])
  erb(:"customers/edit")
end

post 'customers/:id' do
  customer = Customer.find(params[:id])
  customer.update()
  erb(:"customers/update_success")
end

post '/customers/:id/delete' do
  @customer = Customer.find(params[:id])
  @customer.delete()
  redirect to '/customers'
end
