require 'rails_helper'

describe 'blog_posts/index', :type => :view do
  subject {
    blog_posts = FactoryGirl.create_list :blog_post_with_tags, 5
    assign(:blog_posts, blog_posts)
    render
    JSON.parse(rendered)
  }

  it_behaves_like 'blog post' do
    let(:blog_post) {subject['blog_posts'][0]}
  end

  it 'should return valid json' do
    expect(subject['blog_posts'].count).to eq 5
  end
  it 'should have pagination info' do
    expect(subject).to have_key('pages')
    expect(subject['pages']['count']).to eq BlogPost.count
  end
end
