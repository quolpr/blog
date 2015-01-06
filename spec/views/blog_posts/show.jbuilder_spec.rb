require 'rails_helper'

describe 'blog_posts/show', :type => :view do
  subject {
    assign(:blog_post, blog_post)
    render
    JSON.parse(rendered)
  }
  let(:blog_post){FactoryGirl.build(:blog_post_with_tags)}

  it 'show full post' do
    expect(subject['post']).to eq blog_post.post
  end
end
