require 'rails_helper'

feature 'Creating new blog post', js:true do
  let(:blog_post) { FactoryGirl.build :blog_post_with_tags}

  scenario 'creating new blog post' do
    page.set_rack_session(admin: true)
    visit '/#/post/create'
    within(".main_content form") do
      fill_in 'tittle', :with => blog_post.tittle
      fill_in 'post', :with => blog_post.post
      fill_in 'tags', :with => blog_post.tags.collect(&:name).join(',')
    end
    click_button 'publish!'
  end


end