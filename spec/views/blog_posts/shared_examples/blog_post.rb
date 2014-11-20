shared_examples 'blog post' do
  it 'should be valid' do
    expect(blog_post.count).to eq 6
    expect(blog_post['tags'].count).to eq 5
    expect(blog_post['tags'][0].count).to eq 2
  end
end

shared_examples 'when post is invalid' do
  before :each do
    @blog_post = FactoryGirl.build(:bad_blog_post)
  end

  it 'should return validation errors' do
    expect(subject).to eq({'errors' =>{'post' =>['too_short']}})
  end
end