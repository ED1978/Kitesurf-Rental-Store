require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/customer_controller.rb')
require_relative('controllers/stock_item_controller.rb')
require_relative('controllers/rental_controller.rb')

get '/home' do
  erb(:home)
end
