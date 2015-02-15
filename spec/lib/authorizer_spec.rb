require 'rails_helper'
describe Authorizer, :unit do

  describe '#admin?' do
    let(:config) do 
      {user: 'manyrus', pass: '111111'}
    end

    it 'parse config' do
      expect(Settings).to receive(:[]).with('auth').and_return(config)
      subject.admin? 't', 't'
    end

    context 'good auth data' do
      before{subject.config = config}
      it 'return true' do
        expect(subject.admin? config[:user], config[:pass]).to eq true
      end
    end

    context 'bad auth data' do
      before{subject.config = config}
      it 'return false' do
        expect(subject.admin? 'tt', config[:pass]).to eq false
      end
    end
  end
end


