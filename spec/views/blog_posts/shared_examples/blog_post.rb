shared_examples 'blog post' do
  it 'should be valid' do
    expect(subject).not_to have_key 'errors'
  end
end

shared_examples 'when post is invalid' do
  let(:blog_post) {FactoryGirl.build(:bad_blog_post)}

  it 'return validation errors' do
    expect(subject).to have_key 'errors'
  end
end