require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('parcel test page', {:type => :feature}) do
  it("displays the root page") do
    visit('/')
    expect(page).to have_content('Welcome to the parcel shipping calculator!')
  end

  it("returns weight times cost factor if distance is under 50") do
    visit('/')
    fill_in('height', :with => '3')
    fill_in('length', :with => '3')
    fill_in('width', :with => '3')
    fill_in('weight', :with => '1')
    fill_in('distance', :with => '49')
    click_button('Enter')
    expect(page).to have_content("Your shipping cost is 5 dollars")
  end

  it("returns weight times cost factor if distance is greater than 300") do
    visit('/')
    fill_in('height', :with => '3')
    fill_in('length', :with => '3')
    fill_in('width', :with => '3')
    fill_in('weight', :with => '14')
    fill_in('distance', :with => '386')
    click_button('Enter')
    expect(page).to have_content("Your shipping cost is 42.0 dollars")
  end


end
