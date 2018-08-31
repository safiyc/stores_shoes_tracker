require 'bundler/setup'
Bundler.require(:default)

require 'sinatra' 
require 'sinatra/activerecord'

require 'pry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

post("/stores") do
  store_name = params.fetch("store_name")
  store = Store.new({:store_name => store_name, :id => nil})
  store.save
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

post("/brands") do
  brand_name = params.fetch("brand_name")
  price = params.fetch("price")
  brand = Brand.new({:brand_name => brand_name, :price => price, :id => nil})
  brand.save
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

# from index to shoes page
get '/brands/:id' do
  @brand = Brand.find(params[:id])
  erb(:brand_page)
end

# from shoes page to shoes edit page
get("/brands/:id/edit") do
  @brand =  Brand.find(params.fetch("id").to_i())
  erb(:brand_edit)
end

# in shoes edit page; then, back to shoes page
patch("/brands/:id") do
  brand_name = params.fetch("brand_name")
  price = params.fetch("price")
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.update({:brand_name => brand_name})
  @brand.update({:price => price})
  erb(:brand_page)
end

# in shoes edit page; then, back to index
delete("/brands/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.delete
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

# from index to store page
get '/stores/:id' do
  @store = Store.find(params[:id])
  @brands = Brand.all
  erb(:store_page)
end

# from store page to store edit page
get("/stores/:id/edit") do
  @store =  Store.find(params.fetch("id").to_i())
  erb(:store_edit)
end

# in store edit page; then, back to store page
patch("/stores/:id") do
  store_name = params.fetch("store_name")
  @store = Store.find(params.fetch("id").to_i())
  @store.update({:store_name => store_name})
  @brands = Brand.all
  erb(:store_page)
end

# in store edit page; then, back to index
delete("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

# in store page; patching to select existing shoes to put in this store page
patch("/store-shoes/:id") do
  store_id = params.fetch("id").to_i()
  @store = Store.find(store_id)
  brand_ids = params.fetch("brand_ids")
  @store.update({:brand_ids => brand_ids})
  @brands = Brand.all()
  erb(:store_page)
end