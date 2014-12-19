require 'rails_helper'

describe Tag, :unit do
  it{should validate_uniqueness_of(:name).with_message(ValidationError::NOT_UNIQUE)}
  it{should ensure_length_of(:name).is_at_least(3).with_message(ValidationError::TOO_SHORT)}
  it{should have_and_belong_to_many :blog_posts}

  describe '#strToTags' do
  	let(:tags) {'test, tag'}
    let(:result) {[
        FactoryGirl.build(:tag, id:0, name:'test'),
        FactoryGirl.build(:tag, id:1, name:'tag')
    ]}
    
    context 'parsing tags' do
      def check_it
        expect(Tag).to receive(:find).with(name: ['test', 'tag']).and_return(result)
        Tag.strToTags(tags)
      end

      context 'has double comma' do
        let (:tags) {'test,, tag'}

        it 'cut down their' do
          check_it
        end
      end

      context 'has repeated tags' do
        let (:tags) {'test, test, tag'}

        it 'cut down their' do
          check_it
        end
      end

      context 'has empty tag' do
        let (:tags) {'test, , tag'}

        it 'cut down their' do
          check_it
        end
      end

      context 'has upper chars' do
        let (:tags) {'TeSt, TaG'}

        it 'convert their to lower' do
          check_it
        end
      end
    end

    context 'tags exist'  do
      it 'use existence' do
        expect(Tag).to receive(:find).with(name:['test', 'tag']).and_return(result)
        expect(Tag.strToTags(tags)).to eq result
      end
    end

    context 'some tags not exist' do
      it 'find tags' do
        expect(Tag).to receive(:find).with(name:['test', 'tag']).and_return([FactoryGirl.build(:tag, id:0, name:'test')])
        allow(Tag).to receive(:create)
        Tag.strToTags(tags)
      end

      it 'creates new' do
        allow(Tag).to receive(:find).and_return([FactoryGirl.build(:tag, id:0, name:'test')])
        expect(Tag).to receive(:create) do |params|
          expect(params).to eq [{name: 'tag'}]
          params[0] = result[1]
        end
        expect(Tag.strToTags(tags)).to eq result
      end
    end

  end
end
