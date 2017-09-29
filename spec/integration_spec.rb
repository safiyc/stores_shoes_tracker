require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the store/shoe creation paths', {:type => :feature} do
  it 'takes the user to the homepage after a store or shoes is created' do
    visit '/'
    fill_in('store_name', :with => 'Store1')
    click_button('Add Store')
    fill_in('brand_name', :with => 'shoe1')
    fill_in('price', :with => '5')
    click_button("Add Shoes")
    expect(page).to have_content('Store1')
    expect(page).to have_content('shoe1')
  end
end

describe 'the store detail page creation path', {:type => :feature} do
  it 'takes the user to the store detail page after clicking on store name on mainpage' do
    visit '/'
    fill_in('store_name', :with => 'Store1')
    click_button('Add Store')
    click_link ('Store1')
    expect(page).to have_content('Store1')
  end
end

describe 'the store edit path', {:type => :feature} do
  it 'allows a user to change the name of the store' do
    store1 = Store.create({:store_name => 'store1'})
    visit '/'
    click_link('store1')
    click_link('Edit Name')
    fill_in('store_name', :with => 'storeb')
    click_button('Update Store')
    expect(page).to have_content('storeb')
  end
end
