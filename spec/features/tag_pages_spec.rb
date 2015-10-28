require 'rails_helper'

describe 'the add a tag process' do 
  it 'adds a new tag to index page' do
  	visit posts_path
    admin = FactoryGirl.create(:admin)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => admin.email 
    fill_in 'Password', :with => admin.password
    click_on 'Log in'
  	click_on "Add Tag"
  	fill_in 'tag_name', :with => 'Ruby'
  	click_on 'Submit'
  	expect(page).to have_content "Ruby"
  end

  it "gives error when no title or body is entered" do
    visit new_tag_path
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end

describe "the edit a tag process" do
  it "edits a tag" do
    admin = FactoryGirl.create(:admin)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => admin.email 
    fill_in 'Password', :with => admin.password
    click_on 'Log in'
    tag = Tag.create(:name=>"Ruby")
    visit root_path
    click_on 'Edit'
    fill_in 'tag_name', :with => "Java"
    click_on 'Submit'
    expect(page).to_not have_content 'Ruby'
  end
end

describe "the delete a tag process" do
  it "deletes a tag" do
    admin = FactoryGirl.create(:admin)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => admin.email 
    fill_in 'Password', :with => admin.password
    click_on 'Log in'
    tag = Tag.create(:name=>"Ruby")
    visit root_path
    click_on "Add Tag"
    fill_in 'tag_name', :with => "Java"
    click_on 'Submit'
    visit root_path
    click_on 'Delete Tag'
    expect(page).to_not have_content 'Ruby'
  end
end