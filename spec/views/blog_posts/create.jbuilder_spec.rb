require 'rails_helper'

describe 'blog_posts/create', :type => :view do
  subject {
    assign(:blog_post, @blog_post)
    render
    JSON.parse(rendered)
  }

  context 'when all is valid' do
    before :each do
      @blog_post = FactoryGirl.create(:blog_post_with_tags)
    end

    it 'should return id' do
      expect(subject['id']).to be @blog_post.id
    end
  end

  it_behaves_like 'when post is invalid'
end
