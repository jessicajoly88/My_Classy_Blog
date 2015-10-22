require 'rails_helper'

describe 'the add a post process' do 
  it 'adds a new post' do
  	visit posts_path
  	click_on "New Post"
  	fill_in 'Title', :with => 'Yo Man'
  	fill_in 'Body', :with => 'Rails is the best thing ever'
  	click_on 'Submit'
  	expect(page).to have_content "Yo"
  end

  it "gives error when no title or body is entered" do
    visit new_post_path
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end

describe "the edit a post process" do
  it "edits a post" do
    post = Post.create(:title=> "This Sucks", :body=> "Hot and Steamy")
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => 'Hawt'
    click_on 'Submit'
    expect(page).to have_content 'Hawt'
  end

  it "gives error when no title or body is entered" do
    post= Post.create(:body => "Hot and Steamy", :title => "Betrayal")
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => ''
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end

describe "the delete a post process" do
  it "deletes a post" do
    post= Post.create(:body => "Hot and Steamy", :title => "Betrayal")
    visit post_path(post)
    click_on 'Delete'
    expect(page).to_not have_content 'Betrayal'
  end
end	
