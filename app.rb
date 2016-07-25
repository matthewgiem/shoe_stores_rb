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

get('/brands/new') do
  @brands = Brand.all()
  erb(:brand_form)
end

get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

get('/stores/new') do
  @stores = Store.all()
  erb(:store_form)
end

post('/brands/new') do
  name = params.fetch('name')
  Brand.create({:name => name})
  redirect to('/brands/new')
end

post('/stores/new') do
  name = params.fetch('name')
  Store.create({:name => name})
  redirect to('/stores/new')
end

get('/stores/:id/edit') do
  id = params.fetch('id').to_i()
  @store = Store.find(id)
  erb(:store_update)
end

patch('/stores/:id') do
  id = params.fetch('id').to_i()
  name = params.fetch('name')
  store = Store.find(id)
  store.update({:name => name})
  redirect to("/stores/#{id}")
end

delete('/stores/:id') do
  id = params.fetch('id').to_i()
  store = Store.find(id)
  store.delete()
  redirect to("/stores/new")
end

get('/brands/:id/edit') do
  id = params.fetch('id').to_i()
  @brand = Brand.find(id)
  @stores = Store.all()
  erb(:brand_update)
end

post('/brands/:id') do
  id = params.fetch('id').to_i()
  brand = Brand.find(id)
  store_ids = params['store_ids']
  brand_stores = brand.update({:store_ids => store_ids})
  redirect to("brands/#{id}/edit")
end
