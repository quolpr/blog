require 'rails_helper'

describe 'blog_posts/create', :type => :view do
  subject {
    assign(:blog_post, blog_post)
    render
    JSON.parse(rendered)
  }

  let(:blog_post) {FactoryGirl.build(:blog_post_with_tags, id:2)}

  context 'when all is valid' do
    it 'return id' do
      expect(subject['id']).to eq blog_post.id
    end
  end

  it_behaves_like 'when post is invalid'
end
