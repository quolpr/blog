require 'rails_helper'

describe 'blog_posts/show', :type => :view do
  context 'when user' do
    subject {
      assign(:blog_post, FactoryGirl.create(:blog_post_with_tags))
      render
      JSON.parse(rendered)
    }

    it_behaves_like 'blog post' do
      let(:blog_post) {subject}
    end
  end
end
