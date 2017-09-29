require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the store/shoe creation paths', {:type => :feature} do
  it 'takes the user to the homepage after a store is created' do
    visit '/'
    fill_in('store_name', :with => 'Store1')
    click_button('Add Store')
    fill_in('brand_name', :with => 'shoe1')
    fill_in('price', :with => '5')
    expect(page).to have_content('Store1')
    expect(page).to have_content('shoe1')
  end
end
