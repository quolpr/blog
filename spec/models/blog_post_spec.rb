require 'rails_helper'
describe BlogPost, :unit do
  it{should ensure_length_of(:title).is_at_least(5).with_message(ValidationError::TOO_SHORT)}
  it{should ensure_length_of(:post).is_at_least(10).with_message(ValidationError::TOO_SHORT)}
  it{should validate_uniqueness_of(:title).with_message(ValidationError::NOT_UNIQUE)}
  it{should ensure_length_of(:path).is_at_least(5).with_message(ValidationError::TOO_SHORT)}
  
  it{should have_and_belong_to_many :tags}
  it{should validate_presence_of :tags}

  describe '#main_part and #preamble_part' do
    context 'splitter is exist in post' do
      let(:post){"tittle" + BlogPost::SPLITTER  + "body"}
      let(:preamble_part){"tittle"}
      let(:main_part){"body"}

      subject{BlogPost.new(post:post)}

      it 'return preamble part' do
        expect(subject.preamble_part).to eq preamble_part
      end

      it 'return main part' do
        expect(subject.main_part).to eq main_part
      end
    end

    context 'post has many splitter' do
      let(:post){"tittle" + BlogPost::SPLITTER  + "body" + BlogPost::SPLITTER + "test"}
      let(:preamble_part){"tittle"}
      let(:main_part){"body" + BlogPost::SPLITTER + "test"}

      subject{BlogPost.new(post:post)}

      it 'split with first splitter' do
        expect(subject.preamble_part).to eq preamble_part
        expect(subject.main_part).to eq main_part
      end
    end

    context 'no splitter in body' do
      let(:post){"tittle body"}
      let(:preamble_part){""}
      let(:main_part){"tittle body"}

      subject{BlogPost.new(post:post)}

      it 'preamble part is empty' do
        expect(subject.preamble_part).to eq preamble_part
      end

      it 'has main part' do
        expect(subject.main_part).to eq main_part
      end
    end
  end

  describe 'before_validation' do
    describe '#normalize_tags' do
      let(:blog_post){FactoryGirl.build :blog_post}
      it 'normalize_tags' do
        expect(Tag).to receive(:normalize_params).with(blog_post.tags)
        blog_post.send(:normalize_tags)
      end

      it 'set it to self' do
        allow(Tag).to receive(:normalize_params).and_return(ret = double)
        expect(blog_post.tags).to eq ret
        blog_post.send(:normalize_tags)
      end
    end
  end



  
end
