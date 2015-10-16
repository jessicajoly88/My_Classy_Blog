require 'rails_helper'

describe 'the add a tag process' do 
  it 'adds a new tag' do
  	visit posts_path
  	click_on "Add Tag"
  	fill_in 'Name', :with => 'Ruby'
  	click_on 'Create Tag'
  	expect(page).to have_content "Ruby"
  end

  it "gives error when no title or body is entered" do
    visit new_tag_path
    click_on 'Create Tag'
    expect(page).to have_content 'errors'
  end
end