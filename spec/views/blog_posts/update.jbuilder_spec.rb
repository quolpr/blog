require 'rails_helper'

describe 'blog_posts/update', :type => :view do
  subject {
    assign(:blog_post, @blog_post)
    render
    JSON.parse(rendered)
  }

  it_behaves_like 'when post is invalid'
end
