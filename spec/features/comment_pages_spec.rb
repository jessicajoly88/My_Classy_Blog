require 'rails_helper'

describe 'the add a comment process' do
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
