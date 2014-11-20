describe Authorizer do

  describe '#admin?' do
    def config
      {
          user:     'manyrus',
          password: '111111'
      }
    end

    subject {
      expect(YAML).to receive(:load_file).once.with('./config/app.yml').and_return(config)
      Authorizer.new
    }

    context 'good auth data' do
      it 'return true' do
        expect(subject.admin? config[:user], config[:password]).to eq true
      end
    end

    context 'bad auth date' do
      it 'return false' do
        expect(subject.admin? 'tt', config[:password]).to eq false
      end
    end
  end
end