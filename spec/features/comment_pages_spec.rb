require 'rails_helper'

describe 'the add a comment process' do
  before(:each) do
    admin = FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => admin.email
    fill_in 'Password', :with => admin.password
    click_on 'Log in'
  end

  it 'adds a comment to a post' do
  	post = Post.create(:title => "The new beginning", :body => "Blablabalaba")
  	visit post_path(post)
  	click_on 'Leave a Comment'
  	fill_in 'Content', :with => "this is the bes thing ever ver ever"
  	click_on 'Post Comment'
  	expect(page).to have_content "bes"
  end

  it "gives error when content is not entered" do
     post= Post.create(:title => "Hot and Steamy", :body => "Betrayal")
     visit post_path(post)
     click_on 'Leave a Comment'
  	 fill_in 'Content', :with => " "
  	 click_on 'Post Comment'
     expect(page).to have_content 'errors'
   end
end

describe  "the edit a comment process" do
  before(:each) do
    admin = FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => admin.email
    fill_in 'Password', :with => admin.password
    click_on 'Log in'
  end

	it "edits a comment" do
	    post = Post.create(:title=> "This Sucks", :body=> "Hot and Steamy")
      visit post_path(post)
      click_on 'Leave a Comment'
      fill_in 'Content', :with => "this is the bes thing ever ver ever"
  	  click_on 'Post Comment'
  	  click_on 'Edit Comment'
  	  fill_in 'Content', :with => "this is the best thing ever"
  	  click_on 'Post Comment'
  	  expect(page).to have_content 'best'
	end
end

describe "the delete a comment process" do
  before(:each) do
    admin = FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => admin.email
    fill_in 'Password', :with => admin.password
    click_on 'Log in'
  end
  
	it "deletes a comment" do
	  post = Post.create(:title=> "This Sucks", :body=> "Hot and Steamy")
      visit post_path(post)
      click_on 'Leave a Comment'
      fill_in 'Content', :with => "this is the bes thing ever ver ever"
  	  click_on 'Post Comment'
  	  click_on 'Delete Comment'
  	  expect(page).to_not have_content 'best'
	end
end
