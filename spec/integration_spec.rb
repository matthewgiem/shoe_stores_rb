
require("spec_helper")
require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

def expect_page(arr)
  arr.each() do |element|
    expect(page).to have_content(element)
  end
end

describe('viewing salon system home page', {:type => :feature}) do

  it("wont save if you don't enter in anything for the string on the new store page") do
    visit('/store')
    fill_in("name", :with => '')
    click_on('submit')
    expect_page(["new store name:"])
  end

  it("wont save if you don't enter in anything for the string on the new brand page") do
    visit('/brand')
    fill_in("name", :with => '')
    click_on('submit')
    expect_page(["new brand name:"])
  end

end
