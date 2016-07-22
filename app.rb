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

get('/brand') do
  @brands = Brand.all()
  erb(:brand)
end

get('/store') do
  erb(:store)
end

post('/brand/new') do
  name = params.fetch('name')
  Brand.create({:name => name})
  redirect to('/brand')
end
