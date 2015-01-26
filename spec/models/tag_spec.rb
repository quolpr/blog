require 'rails_helper'

describe Tag, :unit do
  it{should validate_uniqueness_of(:name).with_message(ValidationError::NOT_UNIQUE)}
  it{should ensure_length_of(:name).is_at_least(3).with_message(ValidationError::TOO_SHORT)}
  it{should have_and_belong_to_many :blog_posts}

  describe '#normalize_params' do
  	let(:tags) {[{name: 'test'}, {name:'tag'}]}
    let(:result) {[
        {name: 'test'},
        {name: 'tag'}
    ]}

    context 'parsing tags' do
      def check_it
        expect(Tag.normalize_params(tags)).to eq result
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
  end
end

