require 'rails_helper'

feature 'Creating new blog post', js:true do
  before do
    session[:admin] = true
  end

  scenario 'creating new blog post' do
    p "jr!\n\n\n\n"
  end
end