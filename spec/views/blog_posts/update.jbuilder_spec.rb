require 'rails_helper'

describe 'blog_posts/update', :type => :view do
  subject {
    assign(:blog_post, blog_post)
    render
    JSON.parse(rendered)
  }

  let(:blog_post) {FactoryGirl.build :blog_post}

  it_behaves_like 'when post is invalid'
end
