require 'rails_helper'

describe 'the add a tag process' do 
  it 'adds a new tag to index page' do
  	visit posts_path
  	click_on "Add Tag"
  	fill_in 'Tag', :with => 'Ruby'
  	click_on 'Create Tag'
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
    tag = Tag.create(:name=>"Ruby")
    visit root_path
    click_on 'Edit'
    fill_in 'Tag', :with => "Java"
    click_on 'Submit'
    expect(page).to_not have_content 'Ruby'
  end
end

describe "the delete a tag process" do
  it "deletes a tag" do
    tag = Tag.create(:name=>"Ruby")
    visit root_path
    click_on 'Delete'
    expect(page).to_not have_content 'Ruby'
  end
end