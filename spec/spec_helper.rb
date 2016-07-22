ENV['RACK_ENV']='test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require('store')
require('brand')


RSpec.configure do |config|
  config.after(:each) do
    Brand.all().each() do |brand|
      brand.destroy()
    end
    Store.all().each() do |store|
      store.destroy()
    end
  end
end
