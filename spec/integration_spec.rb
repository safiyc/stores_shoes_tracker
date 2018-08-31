require "capybara/rspec"
require "./app"
# require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the store/shoe creation paths', {:type => :feature} do
  it 'takes the user to the homepage after a store or shoes is created' do
    visit '/'
    fill_in('store_name', :with => 'store1')
    click_button('Add Store')
    fill_in('brand_name', :with => 'shoe1')
    fill_in('price', :with => '5')
    click_button("Add Shoes")
    expect(page).to have_content('Store1')
    expect(page).to have_content('Shoe1')
  end
end

describe 'the store detail page creation path', {:type => :feature} do
  it 'takes the user to the store detail page after clicking on store name on mainpage' do
    visit '/'
    fill_in('store_name', :with => 'store1')
    click_button('Add Store')
    click_link ('Store1')
    expect(page).to have_content('Store1')
  end
end

describe 'the store edit path', {:type => :feature} do
  it 'allows a user to change the name of the store' do
    store1 = Store.create({:store_name => 'store1'})
    visit '/'
    click_link('Store1')
    click_link('Edit Name')
    fill_in('store_name', :with => 'store b')
    click_button('Update Store')
    expect(page).to have_content('Store B')
  end
end

describe 'the store edit path', {:type => :feature} do
  it 'allows a user to delete a store' do
    store1 = Store.create({:store_name => 'store1'})
    visit '/'
    click_link('Store1')
    click_link('Edit Name')
    click_button('Delete Store')
    expect(page).not_to have_content('Store1')
  end
end

describe 'the shoes belonging to a stores page', {:type => :feature} do
  it 'allows a user to add shoes to store from list of existing shoes' do
    store1 = Store.create({:store_name => 'store1'})
    visit '/'
    fill_in('brand_name', :with => 'shoe1')
    fill_in('price', :with => '5')
    click_button("Add Shoes")
    click_link('Store1')
    check('brand_ids[]')    # all checked existing shoes
    click_button('Add Shoes')
    expect(page).to have_content('Shoe1')
  end
end
