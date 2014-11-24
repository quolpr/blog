require 'rails_helper'

feature 'Looking up recipes', js:true do

  before do
  	@first_post = FactoryGirl.create :blog_post_with_tags, post: "some posssssssssssssssssssssssssssssssssssssssssss"
  	@second_post = FactoryGirl.create :blog_post_with_tags
  end	
  scenario 'visiting home page' do
    visit '/'

    page.has_css?('table tr.foo')
    expect(all('div.blog-post').count).to be > 1
    expect(all('div.info-block').count).to be == 2

    expect(page).to have_content(@first_post.post)
    expect(page).to have_content(@second_post.post)
  end
end