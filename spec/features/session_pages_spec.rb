require 'rails_helper'
 
describe "Session creation/Admin login path" do
  it "logs an admin in and creates a new session" do
    admin = FactoryGirl.create(:admin)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => admin.email 
    fill_in 'Password', :with => admin.password
    click_on 'Log in'
    expect(page). to have_content "Welcome back"
  end

  it "display an error if not logged in " do
  	admin = FactoryGirl.create(:admin)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => admin.email 
    fill_in 'Password', :with => "boo"
    click_on 'Log in'
    expect(page).to have_content "Invalid email or password."
  end

  it "logs an admin out " do
    admin = FactoryGirl.create(:admin)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => admin.email 
    fill_in 'Password', :with => admin.password
    click_on 'Log in'
    click_on 'Logout'
    expect(page).to have_content "Signed out successfully."
  end
end