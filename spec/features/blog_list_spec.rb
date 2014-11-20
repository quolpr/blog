require 'rails_helper'

feature 'Looking up recipes', js:true do
  scenario 'visiting home page' do
    visit '/'
    page.has_css?('table tr.foo')
    expect(all('div.blog-post').count).to be > 1
    expect(all('div.info-block').count).to be == 2
  end
end