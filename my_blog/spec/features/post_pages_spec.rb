require 'rails_helper'

describe 'the add a post process' do 
  it 'adds a new post' do
  	visit posts_path
  	click_on "New Post"
  	fill_in 'Title', :with => 'Yo Man'
  	fill_in 'Body', :with => 'Rails is the best thing ever'
  	click_on 'Create Post'
  	expect(page).to have_content "Yo"
  end

  it "gives error when no title or body is entered" do
    visit new_post_path
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end

	
end