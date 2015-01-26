require 'rails_helper'

describe Tag, :unit do
  it{should validate_uniqueness_of(:name).with_message(ValidationError::NOT_UNIQUE)}
  it{should ensure_length_of(:name).is_at_least(3).with_message(ValidationError::TOO_SHORT)}
  it{should have_and_belong_to_many :blog_posts}

  describe '#normalize_params' do
  	let(:tags) {[{name: 'test'}, {name:'tag'}]}
    let(:result) {[
        {name: 'test', id: 0},
        {name: 'tag', id: 1}
    ]}
    
    context 'parsing tags' do
      def check_it
        expect(Tag).to receive(:where).with(name: ['test', 'tag']).and_return(result)
        Tag.normalize_params(tags)
      end

      context 'has double comma' do
        let (:tags) {[{name: 'test'},{name: ','}, {name:'tag'}]}

        it 'cut down their' do
          check_it
        end
      end

      context 'has repeated tags' do
        let (:tags) {[{name: 'test'}, {name: 'test'}, {name:'tag'}]}

        it 'cut down their' do
          check_it
        end
      end

      context 'has empty tag' do
        let (:tags) {[{name: 'test'}, {name: ' '}, {name:'tag'}]}

        it 'cut down their' do
          check_it
        end
      end
    end

    context 'tags exist'  do
      it 'use existence' do
        expect(Tag).to receive(:where).with(name:['test', 'tag']).and_return(result)
        expect(Tag.normalize_params(tags)).to eq result
      end
    end

    context 'some tags not exist' do
      let(:result){[
        {name: 'test', id: 0},
        {name: 'tag'}
      ]}
      it 'find tags' do
        expect(Tag).to receive(:where).with(name:['test', 'tag']).and_return([FactoryGirl.build(:tag, id:0, name:'test')])
        allow(Tag).to receive(:create)
        Tag.normalize_params(tags)
      end

      it 'join with existence' do
        allow(Tag).to receive(:where).and_return([result[0]])#find only first element
        expect(Tag.normalize_params(tags)).to eq result
      end
    end
  end
end
