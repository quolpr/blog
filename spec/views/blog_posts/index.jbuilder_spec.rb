require 'rails_helper'

describe 'blog_posts/index', :type => :view do
  subject {
    assign(:blog_posts, blog_posts)
    render
    JSON.parse(rendered)
  }

  let(:blog_posts){FactoryGirl.build_list :blog_post_with_tags, 2}

  it 'return array of posts' do
    expect(subject['blog_posts'].count).to eq 2
  end

  it 'have valid posts in array' do
    expect(subject['blog_posts'][0]['title']).to eq blog_posts[0].title
  end

  context 'post' do
    let(:rendered_post) {subject['blog_posts'][0]}

    it 'is valid' do
      expect(rendered_post['title']).to eq blog_posts[0].title
    end

    context 'splitting' do
      context 'preamble_part is empty' do
        it 'render main part' do
          expect(rendered_post['post']).to eq blog_posts[0].post
        end
      end
      it 'render preamble part' do
        blog_posts[0] = FactoryGirl.build :blog_post_with_preamble
        expect(rendered_post['post']).to eq blog_posts[0].preamble_part
      end
    end
  end

  it 'have pagination info' do
    expect(subject['pages']['count']).to eq BlogPost.count
  end
end
