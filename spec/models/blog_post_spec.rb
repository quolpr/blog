require 'rails_helper'
describe BlogPost, :unit do
  it{should validate_length_of(:title).is_at_least(5).with_message(ValidationError::TOO_SHORT)}
  it{should validate_length_of(:post).is_at_least(10).with_message(ValidationError::TOO_SHORT)}
  it{should validate_uniqueness_of(:title).with_message(ValidationError::NOT_UNIQUE)}
  
  it{should have_and_belong_to_many :tags}
  it{should validate_presence_of :tags}

  subject{BlogPost.new(title:'test')}

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

  describe '#create_path' do
    it 'set path' do
      subject.send(:create_path)
      expect(subject.path).to eq subject.title
    end
  end

  describe "before validation" do
    it 'call #create_path' do
      expect(subject).to receive(:create_path)
      subject.run_callbacks(:validation)
    end
  end

  
end
