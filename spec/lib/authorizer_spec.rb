require 'rails_helper'
describe Authorizer, :unit do

  describe '#admin?' do
    let(:config){{user: 'manyrus', password: '111111'}}

    it 'parse config' do
      expect(YAML).to receive(:load_file).once.with('./config/app.yml').and_return(config)
      subject.admin? 't', 't'
    end

    context 'good auth data' do
      before{subject.config = config}
      it 'return true' do
        expect(subject.admin? config[:user], config[:password]).to eq true
      end
    end

    context 'bad auth date' do
      before{subject.config = config}
      it 'return false' do
        expect(subject.admin? 'tt', config[:password]).to eq false
      end
    end
  end
end


