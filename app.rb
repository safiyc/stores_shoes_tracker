require 'bundler/setup'
Bundler.require(:default)
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

get '/stores/:id' do
  @store = Store.find(params[:id])
  # @shoes = @store.brands
  erb(:store_page)
end

get("/stores/:id/edit") do
  @store =  Store.find(params.fetch("id").to_i())
  erb(:store_edit)
end

patch("/stores/:id") do
  store_name = params.fetch("store_name")
  @store = Store.find(params.fetch("id").to_i())
  @store.update({:store_name => store_name})
  erb(:store_page)
end

# delete("/:id") do
#   @store = Store.find(params.fetch("id").to_i())
#   @store.delete
#   @stores = Store.all
#   erb(:index)
# end
