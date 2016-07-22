require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/store')
require('./lib/brand')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

get('/') do
  erb(:index)
end
