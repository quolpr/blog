require 'rails_helper'

describe Tag, :unit do
  it{should validate_uniqueness_of(:name).with_message(ValidationError::NOT_UNIQUE)}
  it{should validate_length_of(:name).is_at_least(3).with_message(ValidationError::TOO_SHORT)}
  it{should have_and_belong_to_many :blog_posts}

  subject{Tag.new(name:'test')}
  
  let(:tags) do
    [{name: 'test'}, {name:'tag'}]
  end

  describe '#create_path' do
    it 'set path' do
      subject.send(:create_path)
      expect(subject.path).to eq subject.name
    end
  end

  describe "before validation" do
    it 'call #create_path' do
      expect(subject).to receive(:create_path)
      subject.run_callbacks(:validation)
    end
  end

  describe "build_tags" do
    let(:tag){FactoryGirl.create :tag}

    context 'tag exist' do
      it 'return exist tag' do
        tags = Tag.build_from_params([{name: tag.name}])
        expect(tags.first).to eq tag
      end
    end

    context 'tag not exist' do
      let(:new_tag){FactoryGirl.build :tag}
      it 'create new tag' do
        tags = Tag.build_from_params([{name: tag.name + 't'}, {name: 'test'}])
        expect(tags.first.name).to eq tag.name + 't'
      end
    end
  end
end

